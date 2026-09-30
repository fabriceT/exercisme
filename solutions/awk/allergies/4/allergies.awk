BEGIN {
    FS=","
    score = 0
    allergies = ""
}

/eggs/         { score = score + 1 }
/peanuts/      { score = score + 2 }
/shellfish/    { score = score + 4 }
/strawberries/ { score = score + 8 }
/tomatoes/     { score = score + 16 }
/chocolate/    { score = score + 32 }
/pollen/       { score = score + 64 }
/cats/         { score = score + 128 }


/allergic_to/ {
    if (and($1, score) != 0) { print "true" }
    else { print "false"}
}

function add_allergy(name) {
    if (length(allergies) > 0) {
        allergies = allergies ","
    }
    allergies = allergies name
}

/list/ {
    tested=$1
    if (and(tested, 1) != 0) {
        add_allergy("eggs")
    }
    if (and(tested, 2) != 0) {
        add_allergy("peanuts")
    }
    if (and(tested, 4) != 0) {
        add_allergy("shellfish")
    }
    if (and(tested, 8) != 0) {
        add_allergy("strawberries")
    }
    if (and(tested, 16) != 0) {
        add_allergy("tomatoes")
    }
    if (and(tested, 32) != 0) {
        add_allergy("chocolate")
    }
    if (and(tested, 64) != 0) {
        add_allergy("pollen")
    }
     if (and(tested, 128) != 0) {
        add_allergy("cats")
    }

    print allergies
}
