package isogram

import "strings"

func IsIsogram(word string) bool {
	var letters = make(map[rune]bool)

	for _, l := range strings.ToLower(word) {
		if l < 'a' || l > 'z' {
			continue
		}

		if _, ok := letters[l]; !ok {

			letters[l] = true
		} else {
			return false
		}
	}
	return true
}
