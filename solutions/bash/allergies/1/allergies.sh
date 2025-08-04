#!/usr/bin/env bash

score=$1
shift
command=$1
shift

ingredients=(
    eggs
    peanuts
    shellfish
    strawberries
    tomatoes
    chocolate
    pollen
    cats
)

function is_allergic_to {
    local ingredient=$1
    local ingredient_score

    for i in $(seq 0 $((${#ingredients[@]} - 1 ))); do
        if [[ "${ingredient}" == "${ingredients[$i]}" ]]; then
            ingredient_score=$(( 1 << i ))
            [[ $(( score & ingredient_score )) == "${ingredient_score}" ]] && return 1
        fi
    done
    return 0
}

function get_ingredient {
    local ingredient_score
    local reported_ingredients=()
    local ingredient_score

    for i in $(seq 0 $((${#ingredients[@]} - 1 ))); do
        ingredient_score=$(( 1 << i ))
        #echo "+ ${ingredient_score}"
        #echo $(( score & ingredient_score ))
        [[ $(( score & ingredient_score )) == "${ingredient_score}" ]] && reported_ingredients+=("${ingredients[$i]}")
    done

    echo "${reported_ingredients[*]}"
}

case "${command}" in
    "list")
        get_ingredient
        ;;
    "allergic_to")
        if is_allergic_to "$@"; then
            echo "false"
        else
            echo "true"
        fi
        ;;
esac
