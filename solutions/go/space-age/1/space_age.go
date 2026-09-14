package spaceage

type Planet string

func getPlanetPeriod(planet Planet) float64 {
	switch planet {
	case "Mercury":
		return 0.2408467
	case "Venus":
		return 0.61519726
	case "Earth":
		return 1.0
	case "Mars":
		return 1.8808158
	case "Jupiter":
		return 11.862615
	case "Uranus":
		return 84.016846
	case "Saturn":
		return 29.447498
	case "Neptune":
		return 164.79132
	default:
		return -1.0
	}
}

func Age(seconds float64, planet Planet) float64 {
	period := getPlanetPeriod(planet)
	if period > 0 {
		return seconds / getPlanetPeriod(planet) / 31557600
	}

	return -1.0
}
