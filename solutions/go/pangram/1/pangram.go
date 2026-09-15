package pangram

import "strings"

func IsPangram(input string) bool {
	letters := make(map[rune]bool)
	lower := strings.ToLower(input)
	for _, c := range lower {
		if c >= 'a' && c <= 'z' {
			letters[c] = true
		}
	}

	return len(letters) == 26
}
