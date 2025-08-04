// Package weather is responsible to display weather condition.
package weather

// CurrentCondition represents the current condition.
var CurrentCondition string
// CurrentLocation is a string for the current city or location.
var CurrentLocation string

// Forecast ...
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
