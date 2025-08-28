

# input: a floating point number
# output: the number rounded to two decimal places
def two_decimal: ((. * 100) | round) / 100;


debug(.)|
if .planet == "Earth" then
    .seconds # / 1.0
elif .planet == "Mercury" then
    .seconds / 0.2408467
elif .planet == "Venus" then
    .seconds / 0.61519726
elif .planet == "Mars" then
    .seconds / 1.8808158
elif .planet == "Jupiter" then
    .seconds / 11.862615
elif .planet == "Saturn" then
    .seconds / 29.447498
elif .planet == "Uranus" then
    .seconds / 84.016846
elif .planet == "Neptune" then
    .seconds / 164.79132
else
    "not a planet" | halt_error
end
| . / 31557600 | two_decimal
