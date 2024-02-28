#!/bin/bash
pwd

newline() {
    echo -e "\n"
}

declare -r path=$(dirname $(realpath "$0"))

declare -i err=0

for file in "$path"/examples/example{0..8}.txt
do
    echo "$file"
    cat "$file"

    declare expected=$(cat "${file%.*}.censored.txt")

    declare output=$(./run.sh "$file" >(cat -) >/dev/null)

    if [[ "$output" == "$expected" ]]
    then
        echo -e "\n[OK]\n"
    else
        wdiff <(cat - <<<"$output") <(cat - <<<"$expected")
        echo -e "\n[FAIL]\n"
        ((err++))
    fi
done

exit $err
