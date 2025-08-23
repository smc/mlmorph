use crate::{GenerationResult, analyser::Analyser, normalizer::normalize};
use sfst::Sfst;

pub struct Generator {
    sfst: Sfst,
}

impl Generator {
    pub fn new() -> Result<Self, Box<dyn std::error::Error>> {
        let sfst = crate::create_sfst()?;
        Ok(Generator { sfst })
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
