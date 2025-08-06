#!/usr/bin/env bash

if [[ $# != 2 ]]; then
    echo "Usage: hamming.sh <string1> <string2>"
    exit 1
fi

string1="$1"
string2="$2"

get_letter() {
    local strand=$1
    local index=$2

    local letter=${strand:$index:1}
    case "$letter" in
        "C"|"A"|"G"|"T")
            echo "${letter}"
            return
            ;;
        *)
            echo "DNA Error"
            exit 1
    esac
}

if [[ ${#string1} != ${#string2} ]]; then
    echo "strands must be of equal length"
    exit 2
fi

distance=0
for i in $(seq 0 $(( ${#string1} - 1))); do
    pattern1=$(get_letter "${string1}" "$i")
    pattern2=$(get_letter "${string2}" "$i")

    if [[ "${pattern1}" != "${pattern2}" ]]; then
        distance=$(( distance + 1))
    fi
done

echo "${distance}"
