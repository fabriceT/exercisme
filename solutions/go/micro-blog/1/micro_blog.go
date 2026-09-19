package microblog

func Truncate(phrase string) string {
	result := make([]rune, 0, 5)
	var count int

	for _, r := range phrase {
		if count == 5 {
			break
		}
		result = append(result, r)
		count++
	}
	return string(result)
}
