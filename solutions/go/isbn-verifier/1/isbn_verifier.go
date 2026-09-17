package isbnverifier

func IsValidISBN(isbn string) bool {
	var count int
	power := 10

	for _, r := range isbn {
		switch {
		case r >= '0' && r <= '9':
			val := int(r - '0')
			count += val * power
			power -= 1
		case r == 'X' && power == 1:
			count += 10
			power -= 1
		case r == '-':
			continue
		default:
			return false
		}
	}

	return count%11 == 0 && power == 0
}
