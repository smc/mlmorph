use std::collections::HashMap;

pub fn normalize(text: &str) -> String {
    let normalization_map: HashMap<&str, &str> = [
        ("ണ്‍", "ൺ"),
        ("ന്‍", "ൻ"),
        ("ര്‍", "ർ"),
        ("ല്‍", "ൽ"),
        ("ള്‍", "ൾ"),
        ("ക്‍", "ൿ"),
        ("ൻ്റ", "ന്റ"),
        ("ൌ", "ൗ"),
    ]
    .iter()
    .cloned()
    .collect();

    let mut result = text.to_string();
    for (key, value) in normalization_map {
        result = result.replace(key, value);
    }
    result
}
