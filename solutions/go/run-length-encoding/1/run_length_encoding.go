package runlengthencoding

import (
	"strconv"
	"strings"
)

func flush(sb *strings.Builder, r rune, count int) {
	if r == 0 {
		return
	}

	if count > 1 {
		sb.WriteString(strconv.Itoa(count))
	}
	sb.WriteRune(r)
}

func RunLengthEncode(input string) string {
	var sb strings.Builder
	var previous rune
	var count int

	for _, r := range input {
		if previous == r {
			count++
			continue
		}

		flush(&sb, previous, count)
		count = 1
		previous = r
	}
	flush(&sb, previous, count)

	return sb.String()
}

func RunLengthDecode(input string) string {
	var sb strings.Builder
	var counter string
	// var previous rune
	var count int

	for _, r := range input {
		if r >= '0' && r <= '9' {
			counter += string(r)
			continue
		}

		if len(counter) > 0 {
			count, _ = strconv.Atoi(counter)
		} else {
			count = 1
		}
		for range count {
			sb.WriteRune(r)
		}
		counter = ""
	}

	return sb.String()
}
