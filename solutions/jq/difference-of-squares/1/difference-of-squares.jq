def squareOfSum:
    [ range(1; . + 1) ] | add | pow(.; 2)
;

def sumOfSquares:
    [ range(1; . + 1) ] | reduce .[] as $item (0; . + pow($item; 2))
;

if .property == "sumOfSquares" then
    .input.number | sumOfSquares
elif .property == "squareOfSum" then
    .input.number | squareOfSum
elif .property == "differenceOfSquares" then
    (.input.number | squareOfSum) - (.input.number | sumOfSquares)
end
