BEGIN {
    FS = ","    # comma is the field separator
}

# Task 1: When the first field is "needs_license",
#         print "true" if the second field contains "car" or "truck".
$1 == "needs_license" { if ($2 ~ /(car|truck)/) { print "true" } else { print "false" } }

# Task 2: When the first field is "resell_price",
#         print the resell value of the original price (second field)
#         given the age of the car (third field).

function coef(age) {
    if (age < 3) { return 0.8 }
    else if (age < 10) { return 0.7 }
    else { return 0.5 }
}

$1 == "resell_price"  { print $2 * coef($3) }
