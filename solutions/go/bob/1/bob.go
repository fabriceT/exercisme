// This is a "stub" file.  It's a little start on your solution.
// It's not a complete solution though; you have to write some code.

// Package bob should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package bob

import (
	"strings"
	"unicode"
)

// Hey should have a comment documenting it.
func Hey(remark string) string {

	// Write some code here to pass the test suite.
	// Then remove all the stock comments.
	// They're here to help you get started but they only clutter a finished solution.
	// If you leave them in, reviewers may protest!

	normalized := strings.Trim(remark, " \t\r\n")
	question := strings.HasSuffix(normalized, "?")
	upper_case := strings.ToUpper(normalized) == normalized
	no_letter := func(s string) bool {
		for _, r := range s {
			if unicode.IsLetter(r) {
				return false
			}
		}
		return true
	}

	switch {
	case len(normalized) == 0:
		return "Fine. Be that way!"
	case question && upper_case && !no_letter(normalized):
		return "Calm down, I know what I'm doing!"
	case question:
		return "Sure."
	case upper_case && !no_letter(normalized):
		return "Whoa, chill out!"

	default:
		return "Whatever."
	}

}
