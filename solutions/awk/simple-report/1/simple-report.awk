BEGIN {
    FS=","
}

{
    # generate and print the output for each record
    average = ((0 + $3$4) + (0 + $5$6)) / 2
    print "#" $1 ", " $2 " = " average
}
