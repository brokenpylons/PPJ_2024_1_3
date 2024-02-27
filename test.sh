#!/bin/bash
pwd

newline() {
    echo -e "\n"
}

declare -r path=$(dirname $(realpath "$0"))

declare -i err=0

declare -r tmp=$(mktemp)

for file in "$path"/examples/example{0..5}.txt
do
    echo "$file"
    cat "$file"

    declare expected=$(cat "${file%.*}.censored.txt")

    :> "$tmp"
    ./run.sh "$file" "$tmp"
    declare output=$(cat "$tmp")

    if [[ "$output" == "$expected" ]]
    then
        echo -e "\n[OK]\n"
    else
        wdiff <(cat - <<<"$output") <(cat - <<<"$expected")
        echo -e "\n[FAIL]\n"
        ((err++))
    fi
done
rm "$tmp"

exit $err
