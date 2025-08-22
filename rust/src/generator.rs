use crate::{GenerationResult, analyser::Analyser, normalizer::normalize};
use sfst::Sfst;
use std::path::PathBuf;

pub struct Generator {
    sfst: Sfst,
}

impl Generator {
    const RESOURCE_PATH: &'static str = "data/malayalam.a";

    pub fn new() -> Result<Self, Box<dyn std::error::Error>> {
        let fsa_path = Self::get_fsa_path()?;
        let sfst = Sfst::new(&fsa_path)?;
        Ok(Generator { sfst })
    }

    fn get_fsa_path() -> Result<String, Box<dyn std::error::Error>> {
        // First try to find the file in the current directory structure
        let current_dir_path = PathBuf::from(Self::RESOURCE_PATH);
        if current_dir_path.exists() {
            return Ok(current_dir_path.to_string_lossy().to_string());
        }

        // Try relative to the executable
        if let Ok(exe_path) = std::env::current_exe() {
            if let Some(exe_dir) = exe_path.parent() {
                let relative_path = exe_dir.join(Self::RESOURCE_PATH);
                if relative_path.exists() {
                    return Ok(relative_path.to_string_lossy().to_string());
                }
            }
        }

        // For development and testing, try some common locations
        let fallback_paths = [
            "malayalam.a",
            "../data/malayalam.a",
            "../../data/malayalam.a",
        ];

        for path in &fallback_paths {
            let path_buf = PathBuf::from(path);
            if path_buf.exists() {
                return Ok(path.to_string());
            }
        }

        Err("Could not find malayalam.a FSA file. Please ensure it's available in the data/ directory.".into())
    }

    pub fn generate(
        &self,
        token: &str,
        weighted: bool,
    ) -> Result<Vec<GenerationResult>, Box<dyn std::error::Error>> {
        let token = normalize(token);
        let generated_results = self.sfst.generate(&token)?;

        if !weighted {
            return Ok(generated_results.into_iter().map(|r| (r, 0)).collect());
        }

        let mut processed_result = Vec::new();
        for generated_result in generated_results {
            let weight = Self::get_weight(&generated_result, &token);
            processed_result.push((generated_result, weight));
        }

        processed_result.sort_by_key(|(_, weight)| *weight);
        Ok(processed_result)
    }

    fn get_weight(generated_word: &str, token: &str) -> i32 {
        let suffixes = ["ിൽ", "ിലും", "ന്റെ", "ന്", "നെ"];

        // Get token weight using the Analyser
        let token_weight = match Analyser::parse_analysis(token) {
            Ok(parsed) => parsed.weight,
            Err(_) => 0,
        };

        let weight = token_weight;

        for (i, suffix) in suffixes.iter().enumerate() {
            if generated_word.ends_with(suffix) {
                return weight + i as i32;
            }
        }

        weight + generated_word.len() as i32
    }
}
