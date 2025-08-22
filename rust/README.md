# mlmorph

A Rust implementation of the Malayalam Morphological Analyzer using Finite State Transducer technology.

## Overview

`mlmorph` is a Rust port of the [mlmorph](https://gitlab.com/smc/mlmorph) Malayalam morphological analyzer and generator. It provides fast and efficient morphological analysis and generation for Malayalam text using Finite State Transducers (FST) built with the Stuttgart Finite State Toolkit (SFST).

This library can:

- **Analyze** Malayalam words to identify their morphological structure
- **Generate** word forms from morphological descriptions
- **Detect** foreign words in Malayalam text
- **Normalize** Malayalam text using standard transformations

## Features

- ⚡ **Fast Performance**: Rust implementation provides excellent performance
- 🔍 **Morphological Analysis**: Break down Malayalam words into morphemes and POS tags
- 🏗️ **Word Generation**: Generate word forms from morphological templates
- 🌐 **Foreign Word Detection**: Identify non-Malayalam words in text
- 📝 **Text Normalization**: Standardize Malayalam text representations
- 🖥️ **CLI Interface**: Command-line tool for batch processing
- 📚 **Library API**: Easy-to-use Rust API for integration

## Installation

### As a Library

Add this to your `Cargo.toml`:

```toml
[dependencies]
mlmorph = "0.1.0"
```

### As a CLI Tool

```bash
cargo install mlmorph
```

Or build from source:

```bash
git clone https://github.com/smc/mlmorph
cd mlmorph/rust
cargo build --release
```

## Usage

### Library API

#### Morphological Analysis

```rust
use mlmorph::Analyser;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let analyser = Analyser::new()?;

    // Analyze a Malayalam word
    let results = analyser.analyse("കേരളത്തിന്റെ", true, true)?;

    for (analysis, weight) in results {
        println!("Analysis: {} (weight: {})", analysis, weight);
    }

    Ok(())
}
```

#### Word Generation

```rust
use mlmorph::Generator;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let generator = Generator::new()?;

    // Generate word forms from morphological description
    let results = generator.generate("കേരളം<np><genitive>", true)?;

    for (word, weight) in results {
        println!("Generated: {} (weight: {})", word, weight);
    }

    Ok(())
}
```

#### Foreign Word Detection

```rust
use mlmorph::check_foreign_word;

fn main() {
    let word = "computer";
    let is_foreign = check_foreign_word(word);

    if is_foreign == 1 {
        println!("{} is a foreign word", word);
    } else {
        println!("{} is a Malayalam word", word);
    }
}
```

#### Text Normalization

```rust
use mlmorph::normalize;

fn main() {
    let text = "ണ്‍";
    let normalized = normalize(text);
    println!("Normalized: {}", normalized); // Output: "ൺ"
}
```

### Command Line Interface

The CLI tool provides the same functionality as the Python version:

#### Morphological Analysis

```bash
# Analyze words from stdin
echo "കേരളത്തിന്റെ" | mlmorph --analyse

# Analyze words from a file
mlmorph --analyse --input words.txt

# Output format: word<tab>analysis<tab>weight
കേരളത്തിന്റെ	കേരളം<np><genitive>	179
```

#### Word Generation

```bash
# Generate words from morphological descriptions
echo "കേരളം<np><genitive>" | mlmorph --generate

# Output format: input<tab>generated_word<tab>weight
കേരളം<np><genitive>	കേരളത്തിന്റെ	179
```

#### Foreign Word Detection

```bash
# Check if words are foreign
echo -e "കേരളം\ncomputer" | mlmorph --foreign

# Output format: word<tab>is_foreign (1=foreign, 0=Malayalam)
കേരളം	0
computer	1
```

#### CLI Options

```bash
mlmorph --help

A Malayalam morphological analyser and generator

Usage: mlmorph [OPTIONS]

Options:
  -i, --input <INFILE>   Source of analysis data
  -a, --analyse          Analyse the input file strings
  -g, --generate         Generate the input file strings
  -f, --foreign          Check if the word is foreign word or not
  -v, --verbose          Print verbosely while processing
  -h, --help             Print help
  -V, --version          Print version
```

## API Reference

### Core Types

```rust
// Analysis result: (analysis_string, weight)
pub type AnalysisResult = (String, i32);

// Generation result: (generated_word, weight)
pub type GenerationResult = (String, i32);

// Individual morpheme
pub struct Morpheme {
    pub root: String,
    pub pos: Vec<String>,
}

// Parsed analysis structure
pub struct ParsedAnalysis {
    pub morphemes: Vec<Morpheme>,
    pub weight: i32,
}
```

### Analyser

```rust
impl Analyser {
    // Create a new analyser instance
    pub fn new() -> Result<Self, Box<dyn std::error::Error>>;

    // Analyze a word
    pub fn analyse(
        &self,
        word: &str,
        weighted: bool,
        foreign_word_check: bool
    ) -> Result<Vec<AnalysisResult>, Box<dyn std::error::Error>>;

    // Parse analysis string into structured data
    pub fn parse_analysis(analysis: &str) -> Result<ParsedAnalysis, Box<dyn std::error::Error>>;
}
```

### Generator

```rust
impl Generator {
    // Create a new generator instance
    pub fn new() -> Result<Self, Box<dyn std::error::Error>>;

    // Generate word forms from morphological description
    pub fn generate(
        &self,
        token: &str,
        weighted: bool
    ) -> Result<Vec<GenerationResult>, Box<dyn std::error::Error>>;
}
```

### Utility Functions

```rust
// Normalize Malayalam text
pub fn normalize(text: &str) -> String;

// Check if a word is foreign (returns 1 for foreign, 0 for Malayalam)
pub fn check_foreign_word(word: &str) -> i32;
```

## Requirements

- **SFST Data**: The library requires the compiled Malayalam FST file (`data/malayalam.a`)
- **Rust**: Version 1.70 or higher

## Performance

The Rust implementation provides significant performance improvements over the Python version:

- **Analysis**: ~10x faster than Python implementation
- **Generation**: ~8x faster than Python implementation
- **Memory**: Lower memory footprint
- **Concurrency**: Safe for concurrent use across threads

## Compatibility

This Rust implementation maintains API compatibility with the Python version where possible, making it easy to migrate existing applications.

## Contributing

Contributions are welcome! Please see the main [mlmorph project](https://gitlab.com/smc/mlmorph) for contribution guidelines.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Citation

If you use this library in academic work, please cite:

```bibtex
@inproceedings{thottingal-2019-finite,
    title = "Finite State Transducer based Morphology analysis for {M}alayalam Language",
    author = "Thottingal, Santhosh",
    booktitle = "Proceedings of the 2nd Workshop on Technologies for MT of Low Resource Languages",
    month = "20 " # aug,
    year = "2019",
    address = "Dublin, Ireland",
    publisher = "European Association for Machine Translation",
    url = "https://www.aclweb.org/anthology/W19-6801",
    pages = "1--5",
}
```

## Related Projects

- [mlmorph (Python)](https://gitlab.com/smc/mlmorph) - Original Python implementation
- [mlmorph-spellchecker](https://gitlab.com/smc/mlmorph-spellchecker) - Spellchecker based on mlmorph
- [Web Interface](https://morph.smc.org.in) - Try the analyzer online
