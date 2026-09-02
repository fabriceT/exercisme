package lasagnamaster

func PreparationTime(layers []string, time int) int {
	if time == 0 {
		time = 2
	}
	return len(layers) * time
}

func Quantities(layers []string) (noodles int, sauce float64) {
	for _, v := range layers {
		if v == "noodles" {
			noodles += 50
		}
		if v == "sauce" {
			sauce += 0.2
		}
	}

	return
}

func AddSecretIngredient(friend_list []string, ingredient []string) {
	if ingredient[len(ingredient)-1] == "?" {
		ingredient[len(ingredient)-1] = friend_list[len(friend_list)-1]
	}
}

func ScaleRecipe(amount []float64, portion int) []float64 {
	quant := append([]float64{}, amount...)

	for i := range quant {
		quant[i] *= float64(portion) / 2
	}

	return quant
}
