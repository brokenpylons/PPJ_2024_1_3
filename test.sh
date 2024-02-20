#!/bin/bash
pwd

newline() {
    echo -e "\n"
}

declare -r path=$(dirname $(realpath "$0"))

declare -i err=0

for file in "$path"/examples/example{0..0}.txt
do
    echo "$file"
    cat "$file"
    declare output=$(./run.sh "$file" /dev/stdout)
    declare expected=$(cat "${file%.*}.censored.txt")

    if [[ "$output" == $(cat "$tokens") ]]
    then
        echo "[OK]"
    else
        wdiff <(cat - <<<"$output") "$tokens"
        newline
        ((err++))
    fi
done

exit $err
