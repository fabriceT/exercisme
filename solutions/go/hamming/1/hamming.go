package hamming

import "errors"

func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("Size mismatch")
	}

	var count int
	for i, _ := range a {
		if a[i] != b[i] {
			count += 1
		}
	}

	return count, nil
}
