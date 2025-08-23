use crate::{
    AnalysisResult, Morpheme, ParsedAnalysis, foreign_word_detector::check_foreign_word,
    normalizer::normalize,
};
use regex::Regex;
use sfst::Sfst;
use std::collections::HashMap;

lazy_static::lazy_static! {
    static ref ANALYSER_REGEX: Regex = {
        Regex::new(r"((?P<root>([^<])+)(?P<tags>(<[^>]+>)+))+").unwrap()
    };

    static ref POS_REGEX: Regex = {
        Regex::new(r"(<(?P<tag>([^>]+))>)+").unwrap()
    };
}

pub struct Analyser {
    sfst: Sfst,
}

impl Analyser {
    pub fn new() -> Result<Self, Box<dyn std::error::Error>> {
        let sfst = crate::create_sfst()?;
        Ok(Analyser { sfst })
    }

    pub fn analyse(
        &self,
        word: &str,
        weighted: bool,
        foreign_word_check: bool,
    ) -> Result<Vec<AnalysisResult>, Box<dyn std::error::Error>> {
        let word = normalize(word);
        let mut analysis_results = self.sfst.analyse(&word)?;

        if analysis_results.is_empty() {
            if foreign_word_check && check_foreign_word(&word) == 1 {
                analysis_results = vec![format!("{}<fw>", word)];
            }
        }

        if !weighted {
            return Ok(analysis_results.into_iter().map(|a| (a, 0)).collect());
        }

        let mut processed_result = Vec::new();
        for analysis in analysis_results {
            let weight = if weighted {
                Self::parse_analysis(&analysis)?.weight
            } else {
                0
            };
            processed_result.push((analysis, weight));
        }

        processed_result.sort_by_key(|(_, weight)| *weight);
        Ok(processed_result)
    }

    pub fn parse_analysis(analysis: &str) -> Result<ParsedAnalysis, Box<dyn std::error::Error>> {
        if analysis.is_empty() {
            return Ok(ParsedAnalysis {
                morphemes: Vec::new(),
                weight: 0,
            });
        }

        let analysis = if analysis.starts_with('<') {
            format!(" {}", analysis)
        } else {
            analysis.to_string()
        };

        let _caps = ANALYSER_REGEX
            .captures(&analysis)
            .ok_or("Could not parse the analysis")?;

        let mut morphemes = Vec::new();
        let roots: Vec<&str> = ANALYSER_REGEX
            .captures_iter(&analysis)
            .filter_map(|cap| cap.name("root"))
            .map(|m| m.as_str())
            .collect();

        let tags_list: Vec<&str> = ANALYSER_REGEX
            .captures_iter(&analysis)
            .filter_map(|cap| cap.name("tags"))
            .map(|m| m.as_str())
            .collect();

        for (i, root) in roots.iter().enumerate() {
            if let Some(tags) = tags_list.get(i) {
                let pos: Vec<String> = POS_REGEX
                    .captures_iter(tags)
                    .filter_map(|cap| cap.name("tag"))
                    .map(|m| m.as_str().to_string())
                    .collect();

                morphemes.push(Morpheme {
                    root: root.to_string(),
                    pos,
                });
            }
        }

        let weight = Self::get_weight(&morphemes);
        Ok(ParsedAnalysis { morphemes, weight })
    }

    fn get_weight(morphemes: &[Morpheme]) -> i32 {
        let morpheme_length = morphemes.len() as i32;
        let mut weight = morpheme_length * 100;

        for morpheme in morphemes {
            for pos in &morpheme.pos {
                weight += morpheme.pos.len() as i32 * 5
                    + morpheme.root.len() as i32 * 2
                    + Self::get_pos_weight(pos) * 3;
            }
        }

        weight
    }

    fn get_pos_weight(pos: &str) -> i32 {
        let weights: HashMap<&str, i32> = [
            ("v", 1),
            ("n", 2),
            ("adv", 3),
            ("adj", 4),
            ("coordinative", 4),
            ("v-n-compound", 4),
            ("prn", 5),
            ("past", 4),
            ("cvb-adv-part-past", 5),
            ("np", 5),
            ("fw", 1),
        ]
        .iter()
        .cloned()
        .collect();

        weights.get(pos).copied().unwrap_or(pos.len() as i32)
    }
}
