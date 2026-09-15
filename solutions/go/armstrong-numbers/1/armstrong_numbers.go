package armstrongnumbers

import "math"

func IsNumber(n int) bool {
	var sum float64
	power := int(math.Log10(float64(n))) + 1

	for temp := n; temp != 0; temp /= 10 {
		sum += math.Pow(float64(temp%10), float64(power))
	}
	return int(sum) == n

}
