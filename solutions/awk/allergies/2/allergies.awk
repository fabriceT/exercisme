BEGIN {
    FS=","
    score = 0
    allergies = ""
}

/eggs/         { score = score + 1 }
/peanuts/      { score = score + 2 }
/shellfish/    { score = score + 4 }
/strawberries/ { score = score + 8 }
/totmatoes/    { score = score + 16 }
/chocolate/    { score = score + 32 }
/pollen/       { score = score + 64 }
/cats/         { score = score + 128 }


/allergic_to/ {
    # print and($1, score) " " score
    if (and($1, score) != 0) { print "true" }
    else { print "false"}
}
