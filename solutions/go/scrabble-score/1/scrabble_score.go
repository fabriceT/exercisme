package scrabblescore

import "strings"

func Score(word string) int {
	var total int
	upper := strings.ToUpper(word)
	for _, r := range upper {
		switch r {
		case 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T':
			total++
		case 'D', 'G':
			total += 2
		case 'B', 'C', 'M', 'P':
			total += 3
		case 'F', 'H', 'V', 'W', 'Y':
			total += 4
		case 'K':
			total += 5
		case 'J', 'X':
			total += 8
		case 'Q', 'Z':
			total += 10
		default:
		}
	}
	return total
}
