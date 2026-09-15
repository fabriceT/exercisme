package atbashcipher

import (
	"strings"
	"unicode"
)

func Atbash(s string) string {
	var sb strings.Builder
	var count int

	for _, r := range s {
		if !unicode.IsLetter(r) && !unicode.IsDigit(r) {
			continue
		}

		if count > 0 && count%5 == 0 {
			sb.WriteByte(' ')
		}

		if unicode.IsLetter(r) {
			sb.WriteRune('a' + 'z' - unicode.ToLower(r))
		} else {
			sb.WriteRune(r)
		}
		count++
	}

	return sb.String()
}
