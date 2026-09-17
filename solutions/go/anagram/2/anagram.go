package anagram

import (
	"sort"
	"strings"
)

type Anagram struct {
	word   string
	sorted string
}

func newAnagram(name string) Anagram {
	lower_name := strings.ToLower(name)
	s := strings.Split(lower_name, "")
	sort.Strings(s)
	return Anagram{
		word:   lower_name,
		sorted: strings.Join(s, ""),
	}
}

func Detect(subject string, candidates []string) []string {
	var result []string

	sub := newAnagram(subject)

	for _, word := range candidates {
		if len(subject) != len(word) {
			continue
		}

		candidate := newAnagram(word)
		if candidate.word != sub.word && sub.sorted == candidate.sorted {
			result = append(result, word)
		}
	}
	return result
}
