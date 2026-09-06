package collatzconjecture

import "errors"

func CollatzConjecture(n int) (int, error) {
	var count int = 0
	if n < 1 {
		return 0, errors.New("error")
	}
	for n > 1 {
		if n%2 == 0 {
			n = n / 2
		} else {
			n = n*3 + 1
		}
		count += 1
	}
	return count, nil
}
