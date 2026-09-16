package rnatranscription

func ToRNA(dna string) string {
	result := []rune(dna)
	for i, r := range dna {
		switch r {
		case 'G':
			result[i] = 'C'
		case 'C':
			result[i] = 'G'
		case 'T':
			result[i] = 'A'
		case 'A':
			result[i] = 'U'
		}
	}

	return string(result)
}
