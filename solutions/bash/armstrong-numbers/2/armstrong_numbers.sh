#!/usr/bin/env bash

# <- 6->
# Azerty
# 012345
# 654321

main() {
    local number=$1
    local sum=0
    local length=${#number}

    for i in $(seq 0 $((length - 1))); do
        value="${number:$i:1}"
        sum=$(( sum + value ** length))
    done


    if [[ $number == $sum ]]; then
        echo "true"
    else
        echo "false"
    fi
}

main "$@"
