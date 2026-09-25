BEGIN {
    FS=","
}

{
    # generate and print the output for each record
    score1 = ($3$4)
    score2 = ($5$6)

    print "#" $1 ", " $2 " = " (score1 + score2) / 2
}
