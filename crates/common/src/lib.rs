//! {{ project-name }} commons.

/// adds two digits
pub fn add(left: u64, right: u64) -> u64 {
    left + right
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn addition() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
