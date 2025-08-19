[ "$#" -ne 1 ] && exit

if [[ "$1" == "total" ]]; then
    echo "2^64 - 1" | bc
    exit 0
fi

if [[ $1 < 1 ]] || [[ $1 > 64 ]]; then
   echo  "Error: invalid input"
   exit 1
 fi

echo "2 ^ $(( $1 - 1 ))" | bc
