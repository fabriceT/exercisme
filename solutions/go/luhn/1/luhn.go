package luhn

func Valid(id string) bool {
	var sum int
	var val int
	var digit_count int

	for i := len(id) - 1; i >= 0; i-- {
		c := id[i]

		if c == ' ' {
			continue
		}

		if c < '0' || c > '9' {
			return false
		}

		val = (int(c) - '0')
		digit_count += 1

		if digit_count%2 == 0 {
			val *= 2
			if val > 9 {
				val -= 9
			}
		}
		sum += val
	}

	r := digit_count > 1 && sum%10 == 0
	return r
}
