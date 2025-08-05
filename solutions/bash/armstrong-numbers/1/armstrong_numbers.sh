#!/usr/bin/env bash

# <- 6->
# Azerty
# 012345
# 654321

main() {
    local number=$1
    local sum=

    for i in $(seq 0 $((${#number} -1))); do
        power=$((${#number} - i))
        chiffre="${number:$index:1}"
        sum+=$((chiffre ** power))
    done

    if [[ $number == "${sum}" ]]; then
        echo "true"
    else
        echo "false"
    fi
}

main "$@"
