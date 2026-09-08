package darts

func Score(x, y float64) int {
	var dist = x*x + y*y

	switch {
	case dist <= 1:
		return 10
	case dist <= 25:
		return 5
	case dist <= 100:
		return 1
	default:
		return 0
	}
}
