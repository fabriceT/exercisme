package anagram

import "strings"

type Anagram struct {
	letters map[rune]int
	word    string
}

func newAnagram(name string) Anagram {
	lower_name := strings.ToLower(name)
	var a = Anagram{
		word:    lower_name,
		letters: map[rune]int{},
	}

	for _, r := range lower_name {
		if _, ok := a.letters[r]; !ok {
			a.letters[r] = 1
		} else {
			a.letters[r]++
		}
	}
	return a
}

func (a Anagram) Compare(b Anagram) bool {
	if a.word == b.word {
		return false
	}

	for r, k := range a.letters {
		count, ok := b.letters[r]
		if !ok {
			return false
		}
		if k != count {
			return false
		}
	}
	return true
}

func Detect(subject string, candidates []string) []string {
	var result []string

	sub := newAnagram(subject)

	for _, word := range candidates {
		if len(subject) != len(word) {
			continue
		}

		new := newAnagram(word)
		if sub.Compare(new) {
			result = append(result, word)
		}
	}
	return result
}
