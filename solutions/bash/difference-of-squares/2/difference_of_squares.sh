#!/usr/bin/env bash

SUM_SQUARE=0
SQUARE_SUM=0

sum_of_squares() {
    local number=$1

    SUM_SQUARE=$(( ($number * (number + 1) * (2 *$number + 1)) / 6 ))
}

square_of_sum() {
    local number=$1

    SQUARE_SUM=$(( (number * (number + 1) / 2) ))
}

difference() {
    local number=$1

    square_of_sum "${number}"
    sum_of_squares "${number}"
}

case "$1" in
    "sum_of_squares")
        sum_of_squares "$2"
        echo "${SUM_SQUARE}"

    ;;
    "square_of_sum")
        square_of_sum "$2"
        echo "${SQUARE_SUM}"
    ;;
    "difference")
        difference "$2"
        echo $(( SQUARE_SUM - SUM_SQUARE ))
    ;;
    *)
        echo "what!"
    ;;
esac
