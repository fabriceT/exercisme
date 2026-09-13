package sumofmultiples

func SumMultiples(limit int, divisors ...int) int {
	if limit <= 0 {
		return 0
	}

	found := make(map[int]bool)

	var count int
	for _, d := range divisors {
		if d <= 0 {
			continue
		}
		for multiple := d; multiple < limit; multiple += d {
			found[multiple] = true
		}
	}
	for k := range found {
		count += k
	}

	return count
}
