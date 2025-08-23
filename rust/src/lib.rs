//! # mlmorph
//!
//! A Rust implementation of the Malayalam Morphological Analyzer using Finite State Transducer technology.
//!
//! ## Overview
//!
//! `mlmorph` is a Rust port of the [mlmorph](https://gitlab.com/smc/mlmorph) Malayalam morphological
//! analyzer and generator. It provides fast and efficient morphological analysis and generation for
//! Malayalam text using Finite State Transducers (FST) built with the Stuttgart Finite State Toolkit (SFST).
//!
//! This library can:
//! - **Analyze** Malayalam words to identify their morphological structure
//! - **Generate** word forms from morphological descriptions
//! - **Detect** foreign words in Malayalam text
//! - **Normalize** Malayalam text using standard transformations
//!
//! ## Features
//!
//! - **Fast Performance**: Rust implementation provides excellent performance
//! - **Morphological Analysis**: Break down Malayalam words into morphemes and POS tags
//! - **Word Generation**: Generate word forms from morphological templates
//! - **Foreign Word Detection**: Identify non-Malayalam words in text
//! - **Text Normalization**: Standardize Malayalam text representations
//! - **CLI Interface**: Command-line tool for batch processing
//! - **Library API**: Easy-to-use Rust API for integration
//!
//! ## Quick Start
//!
//! ### Morphological Analysis
//!
//! ```rust
//! use mlmorph::Analyser;
//!
//! # fn main() -> Result<(), Box<dyn std::error::Error>> {
//! let analyser = Analyser::new()?;
//!
//! // Analyze a Malayalam word
//! let results = analyser.analyse("കേരളത്തിന്റെ", true, true)?;
//!
//! for (analysis, weight) in results {
//!     println!("Analysis: {} (weight: {})", analysis, weight);
//! }
//! # Ok(())
//! # }
//! ```
//!
//! ### Word Generation
//!
//! ```rust
//! use mlmorph::Generator;
//!
//! # fn main() -> Result<(), Box<dyn std::error::Error>> {
//! let generator = Generator::new()?;
//!
//! // Generate word forms from morphological description
//! let results = generator.generate("കേരളം<np><genitive>", true)?;
//!
//! for (word, weight) in results {
//!     println!("Generated: {} (weight: {})", word, weight);
//! }
//! # Ok(())
//! # }
//! ```
//!
//! ### Foreign Word Detection
//!
//! ```rust
//! use mlmorph::check_foreign_word;
//!
//! let word = "computer";
//! let is_foreign = check_foreign_word(word);
//!
//! if is_foreign == 1 {
//!     println!("{} is a foreign word", word);
//! } else {
//!     println!("{} is a Malayalam word", word);
//! }
//! ```
//!
//! ### Text Normalization
//!
//! ```rust
//! use mlmorph::normalize;
//!
//! let text = "ണ്‍";
//! let normalized = normalize(text);
//! assert_eq!(normalized, "ൺ");
//! ```
//!
//! ## Performance
//!
//! The Rust implementation provides significant performance improvements over the Python version:
//!
//! - **Analysis**: ~10x faster than Python implementation
//! - **Generation**: ~8x faster than Python implementation
//! - **Memory**: Lower memory footprint
//! - **Concurrency**: Safe for concurrent use across threads
//!
//! ## Requirements
//!
//! - **SFST Data**: The library requires the compiled Malayalam FST file (`data/malayalam.a`)
//! - **Rust**: Version 1.70 or higher

pub mod analyser;
pub mod foreign_word_detector;
pub mod generator;
pub mod normalizer;

pub use analyser::Analyser;
pub use foreign_word_detector::check_foreign_word;
pub use generator::Generator;
pub use normalizer::normalize;

use include_dir::{Dir, include_dir};
use sfst::Sfst;
use std::fs;
use tempfile::TempDir;

pub fn create_sfst() -> Result<Sfst, Box<dyn std::error::Error>> {
    const DATA_DIR: Dir<'_> = include_dir!("$CARGO_MANIFEST_DIR/data");
    let tmp_dir = TempDir::new()?;
    let file_path = tmp_dir.path().join("malayalam.a");
    let fsa_path = DATA_DIR
        .get_file("malayalam.a")
        .ok_or("Could not find malayalam.a")?;
    let body = fsa_path.contents();
    fs::write(&file_path, body)?;
    let sfst = Sfst::new(file_path.as_path().to_str().ok_or("Invalid file path")?)?;

    // Keep the temp dir alive by leaking it (since SFST needs the file to persist)
    std::mem::forget(tmp_dir);

    Ok(sfst)
}

/// Represents a single morpheme in the morphological analysis.
///
/// A morpheme is the smallest grammatical unit in a language. Each morpheme
/// consists of a root word and associated part-of-speech (POS) tags.
///
/// # Examples
///
/// ```rust
/// use mlmorph::Morpheme;
///
/// let morpheme = Morpheme {
///     root: "കേരളം".to_string(),
///     pos: vec!["np".to_string(), "genitive".to_string()],
/// };
///
/// assert_eq!(morpheme.root, "കേരളം");
/// assert_eq!(morpheme.pos.len(), 2);
/// ```
#[derive(Debug, Clone)]
pub struct Morpheme {
    /// The root word of the morpheme
    pub root: String,
    /// List of part-of-speech tags associated with this morpheme
    pub pos: Vec<String>,
}

/// Represents the complete parsed analysis of a word.
///
/// Contains all morphemes that make up the word and the overall weight
/// of the analysis. Lower weights indicate more preferred analyses.
///
/// # Examples
///
/// ```rust
/// use mlmorph::{ParsedAnalysis, Morpheme};
///
/// let analysis = ParsedAnalysis {
///     morphemes: vec![
///         Morpheme {
///             root: "കേരളം".to_string(),
///             pos: vec!["np".to_string(), "genitive".to_string()],
///         }
///     ],
///     weight: 179,
/// };
///
/// assert_eq!(analysis.morphemes.len(), 1);
/// assert_eq!(analysis.weight, 179);
/// ```
#[derive(Debug, Clone)]
pub struct ParsedAnalysis {
    /// List of morphemes that compose the analyzed word
    pub morphemes: Vec<Morpheme>,
    /// Weight of this analysis (lower is better)
    pub weight: i32,
}

/// Result type for morphological analysis operations.
///
/// Contains the analysis string and its associated weight.
/// The analysis string uses angle brackets to denote morphological tags.
///
/// # Format
///
/// The analysis string follows the format: `root<tag1><tag2>...`
///
/// # Examples
///
/// ```rust
/// use mlmorph::AnalysisResult;
///
/// let result: AnalysisResult = ("കേരളം<np><genitive>".to_string(), 179);
/// let (analysis, weight) = result;
///
/// assert_eq!(analysis, "കേരളം<np><genitive>");
/// assert_eq!(weight, 179);
/// ```
pub type AnalysisResult = (String, i32);

/// Result type for word generation operations.
///
/// Contains the generated word and its associated weight.
/// Lower weights indicate more preferred generations.
///
/// # Examples
///
/// ```rust
/// use mlmorph::GenerationResult;
///
/// let result: GenerationResult = ("കേരളത്തിന്റെ".to_string(), 179);
/// let (word, weight) = result;
///
/// assert_eq!(word, "കേരളത്തിന്റെ");
/// assert_eq!(weight, 179);
/// ```
pub type GenerationResult = (String, i32);

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_morpheme_creation() {
        let morpheme = Morpheme {
            root: "കേരളം".to_string(),
            pos: vec!["np".to_string(), "genitive".to_string()],
        };

        assert_eq!(morpheme.root, "കേരളം");
        assert_eq!(morpheme.pos.len(), 2);
        assert_eq!(morpheme.pos[0], "np");
        assert_eq!(morpheme.pos[1], "genitive");
    }

    #[test]
    fn test_parsed_analysis_creation() {
        let morpheme = Morpheme {
            root: "കേരളം".to_string(),
            pos: vec!["np".to_string()],
        };

        let analysis = ParsedAnalysis {
            morphemes: vec![morpheme],
            weight: 100,
        };

        assert_eq!(analysis.morphemes.len(), 1);
        assert_eq!(analysis.weight, 100);
        assert_eq!(analysis.morphemes[0].root, "കേരളം");
    }

    #[test]
    fn test_analysis_result_type() {
        let result: AnalysisResult = ("കേരളം<np>".to_string(), 100);
        let (analysis, weight) = result;

        assert_eq!(analysis, "കേരളം<np>");
        assert_eq!(weight, 100);
    }

    #[test]
    fn test_generation_result_type() {
        let result: GenerationResult = ("കേരളത്തിന്റെ".to_string(), 150);
        let (word, weight) = result;

        assert_eq!(word, "കേരളത്തിന്റെ");
        assert_eq!(weight, 150);
    }

    #[test]
    fn test_normalize_function_exists() {
        // Test that the normalize function is available
        let text = "ണ്‍";
        let normalized = normalize(text);
        assert_eq!(normalized, "ൺ");
    }

    #[test]
    fn test_check_foreign_word_function_exists() {
        // Test that the check_foreign_word function is available
        let result = check_foreign_word("computer");
        assert_eq!(result, 1);

        let result = check_foreign_word("കേരളം");
        assert_eq!(result, 0);
    }
}
