use regex::Regex;

const ENGLISH_PATTERNS: &[&str] = &[
    r"\\S+[അ-ഔ]\\S+",
    r"\\S+റ്റ്\\S+",
    r"^ജെ",
    r"^ട",
    r"^ഡ",
    r"^ഫാ",
    r"^ഫി",
    r"^ഫീ",
    r"^ഫു",
    r"^ഫെ",
    r"^ഫെ",
    r"^ഫൈ",
    r"^ഫൊ",
    r"^ഫോ",
    r"^ബാൻ",
    r"^ബാറ്റ്",
    r"^ബെ",
    r"^മെറ്റ",
    r"മ്യൂ",
    r"^ഷോ",
    r"^സ്ക്രീ",
    r"^ഹാ",
    r"^ഹി",
    r"^ഹെ",
    r"^ഹൊ",
    r"^ഹോ",
    r"^ഹൗ",
    r"^ഹ്യ",
    r"^ഹ്വ",
    r"^ള",
    r"^ഴ",
    r"^റ",
    r"^റോ",
    r"^റ്റൈ",
    r"ഓൺ",
    r"ക്ച",
    r"ക്ട്$",
    r"ക്യൂ",
    r"ക്സ",
    r"ക്ലോ",
    r"ക്റ്റ്",
    r"ഗ്രഫ",
    r"ഗ്രഫി",
    r"ഗിൾ",
    r"ങ്സ്",
    r"ച്വ",
    r"ജ്യു",
    r"ജ്യൂ",
    r"ട്ര",
    r"ഡിയോ",
    r"ഡ്$",
    r"ഡ്ക",
    r"ഡ്മ",
    r"ഡ്വ",
    r"ഡ്സ",
    r"ണിയൻ$",
    r"ണിയർ$",
    r"ണ്ടർ$",
    r"ൻഡ",
    r"ൻസ്",
    r"ന്റം",
    r"ന്റിക്",
    r"ന്റ്$",
    r"ന്റ്സ്",
    r"ൻ്റ്$",
    r"ന്റർ",
    r"പ്രൊ",
    r"പ്സ്$",
    r"പ്റ്റ",
    r"ഫ്ര",
    r"ഫ്ല",
    r"ഫ്ള",
    r"ഫ്റ്റ",
    r"ഫൈ",
    r"ബിൻ",
    r"ബിർ",
    r"ബിൽ",
    r"ബിൾ",
    r"ബിറ്റ്",
    r"ബെർ",
    r"ബൈ",
    r"ബ്രേ",
    r"ബ്രോ",
    r"ബ്ല",
    r"ബ്സ",
    r"ബ്ള",
    r"മെമ്മ",
    r"മൈസ",
    r"മ്പ്യൂ",
    r"യിറ്റ്",
    r"യ്ൻ",
    r"യ്സ",
    r"യ്സ്",
    r"യിസ",
    r"യ്റ്റ്",
    r"ർജ",
    r"ർട",
    r"ലിറ്റി",
    r"ലീസ്",
    r"ലൈസർ",
    r"ൽസ്",
    r"വെയർ$",
    r"വൈസ്",
    r"വേസ്",
    r"ഷിസ്",
    r"ഷ്യൻ$",
    r"ഷ്യർ$",
    r"ഷ്യൽ$",
    r"ഷ്യസ്$",
    r"സബ്",
    r"സർ$",
    r"സൽ$",
    r"സെൽ",
    r"സെർ",
    r"സെൻ",
    r"സിസ്",
    r"സിറ്റി",
    r"സെന്റ",
    r"സ്കൂൾ",
    r"സ്പേസ്",
    r"സൈറ്റ",
    r"സ്പ്ല",
    r"സ്പ്ള",
    r"സ്ബ",
    r"സ്ല",
    r"സ്ള",
    r"സ്കാൻ",
    r"സ്കോ",
    r"സ്റ്റ",
    r"^സ്വീ",
    r"സ്ല",
    r"സ്ട്ര",
    r"ളജി",
    r"ൾട്ട",
    r"ഴ്സ",
    r"റ്റിക്$",
    r"റ്റിക്കലി$",
    r"റ്റേൺ",
    r"റ്ററ",
    r"റ്റർ",
    r"റ്റലൈ",
    r"റൈറ്റ",
    r"ിംഗ്$",
    r"ിങ്$",
    r"ിങ്ങ്$",
    r"ിഷൻ",
    r"ിസം$",
    r"ിംസ്",
    r"ീസ്$",
    r"േഷൻ",
    r"ൈറ്റ",
    r"ോഷൻ",
    r"ൗണ്ട",
    r"്രീം",
    r"ക്വേ",
    r"[0-9]+",
];

lazy_static::lazy_static! {
    static ref COMPILED_ENGLISH_PATTERN: Regex = {
        let pattern = ENGLISH_PATTERNS.join("|");
        Regex::new(&pattern).unwrap()
    };

    static ref MALAYALAM_PATTERN: Regex = {
        Regex::new(r"[\u{0D00}-\u{0D7F}\u{200C}-\u{200D}]+").unwrap()
    };

    static ref ZWS_PATTERN: Regex = {
        Regex::new(r"[\u{200B}-\u{200D}]").unwrap()
    };
}

pub fn check_foreign_word(word: &str) -> i32 {
    let word = word.trim();
    // Remove all ZWS, ZWNJ, ZWJ before pattern matching
    let word = ZWS_PATTERN.replace_all(word, "");

    if !is_valid_malayalam_word(&word) {
        // Unknown word. Surely foreign
        return 1;
    }

    if has_sure_patterns(&word) {
        return 1;
    }

    0
}

fn has_sure_patterns(word: &str) -> bool {
    COMPILED_ENGLISH_PATTERN.is_match(word)
}

fn is_valid_malayalam_word(word: &str) -> bool {
    if word.len() <= 1 {
        return false;
    }

    // Ignore all non-Malayalam words
    MALAYALAM_PATTERN.is_match(word)
}
