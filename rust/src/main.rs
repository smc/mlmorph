use clap::Parser;
use mlmorph::{Analyser, Generator, check_foreign_word};
use std::fs::File;
use std::io::{BufRead, BufReader, stdin};
use std::path::PathBuf;

#[derive(Parser)]
#[command(name = "mlmorph")]
#[command(about = "A Malayalam morphological analyser and generator")]
#[command(version = env!("CARGO_PKG_VERSION"))]
struct Cli {
    /// Source of analysis data
    #[arg(short, long, value_name = "INFILE")]
    input: Option<PathBuf>,

    /// Analyse the input file strings
    #[arg(short, long)]
    analyse: bool,

    /// Generate the input file strings
    #[arg(short, long)]
    generate: bool,

    /// Check if the word is foreign word or not
    #[arg(short, long)]
    foreign: bool,

    /// Print verbosely while processing
    #[arg(short, long)]
    verbose: bool,
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let cli = Cli::parse();

    if cli.verbose {
        match &cli.input {
            Some(path) => println!("reading from {}", path.display()),
            None => println!("reading from stdin"),
        }
    }

    let analyser = if cli.analyse {
        Some(Analyser::new()?)
    } else {
        None
    };

    let generator = if cli.generate {
        Some(Generator::new()?)
    } else {
        None
    };

    let reader: Box<dyn BufRead> = match cli.input {
        Some(path) => {
            let file = File::open(path)?;
            Box::new(BufReader::new(file))
        }
        None => Box::new(stdin().lock()),
    };

    for line in reader.lines() {
        let line = line?;
        let line = line.trim();

        if line.is_empty() {
            continue;
        }

        if cli.analyse {
            if let Some(ref analyser) = analyser {
                match analyser.analyse(line, true, true) {
                    Ok(anals) => {
                        if anals.is_empty() {
                            println!("{}\t?", line);
                        } else {
                            for (analysis, weight) in anals {
                                println!("{}\t{}\t{}", line, analysis, weight);
                            }
                        }
                    }
                    Err(e) => eprintln!("Error analyzing '{}': {}", line, e),
                }
            }
        }

        if cli.generate {
            if let Some(ref generator) = generator {
                match generator.generate(line, true) {
                    Ok(gens) => {
                        if gens.is_empty() {
                            println!("{}\t?", line);
                        } else {
                            for (generated, weight) in gens {
                                println!("{}\t{}\t{}", line, generated, weight);
                            }
                        }
                    }
                    Err(e) => eprintln!("Error generating for '{}': {}", line, e),
                }
            }
        }

        if cli.foreign {
            let is_foreign = check_foreign_word(line);
            println!("{}\t{}", line, is_foreign);
        }
    }

    println!();
    Ok(())
}
