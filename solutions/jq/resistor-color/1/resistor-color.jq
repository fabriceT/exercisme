{
    "black": 0,
    "brown": 1,
    "red": 2,
    "orange": 3,
    "yellow": 4,
    "green": 5,
    "blue": 6,
    "violet": 7,
    "grey": 8,
    "white": 9
} as $colors

| if .property == "colorCode" then
    $colors[.input.color]
else
    $colors | to_entries | map( .key)
end

#"Remove this line and implement your solution" | halt_error
