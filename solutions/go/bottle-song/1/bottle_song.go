package bottlesong

import (
	"fmt"
)

func bottleNumber(bottle int) string {
	switch bottle {
	case 0:
		return "no"
	case 1:
		return "one"
	case 2:
		return "two"
	case 3:
		return "three"
	case 4:
		return "four"
	case 5:
		return "five"
	case 6:
		return "six"
	case 7:
		return "seven"
	case 8:
		return "eight"
	case 9:
		return "nine"
	case 10:
		return "ten"
	}
	return fmt.Sprintf("%d", bottle)
}

func bottleNumberCaps(bottle int) string {
	switch bottle {
	case 0:
		return "No"
	case 1:
		return "One"
	case 2:
		return "Two"
	case 3:
		return "Three"
	case 4:
		return "Four"
	case 5:
		return "Five"
	case 6:
		return "Six"
	case 7:
		return "Seven"
	case 8:
		return "Eight"
	case 9:
		return "Nine"
	case 10:
		return "Ten"
	}
	return fmt.Sprintf("%d", bottle)
}

func bottleName(bottle int) string {
	if bottle == 1 {
		return "bottle"
	}
	return "bottles"
}

func Recite(startBottles, takeDown int) []string {
	var result []string

	for i := 0; i < takeDown; i++ {
		current := startBottles - i
		next := current - 1

		t := fmt.Sprintf("%s green %s hanging on the wall,",
			bottleNumberCaps(current),
			bottleName(current))
		result = append(result, t)
		result = append(result, t)
		result = append(result, "And if one green bottle should accidentally fall,")
		t = fmt.Sprintf("There'll be %s green %s hanging on the wall.",
			bottleNumber(next),
			bottleName(next))
		result = append(result, t)
		if i < takeDown-1 {
			result = append(result, "")
		}
	}

	return result
}
