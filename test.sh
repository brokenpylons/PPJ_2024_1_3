#!/bin/bash
pwd

newline() {
    echo -e "\n"
}

declare -r path=$(dirname $(realpath "$0"))

declare -i err=0

for file in "$path"/examples/example{0..5}.txt
do
    echo "$file"
    cat "$file"
    declare output=$(./run.sh "$file" /dev/stdout)
    declare expected=$(cat "${file%.*}.censored.txt")

    if [[ "$output" == "$expected" ]]
    then
        echo -e "\n[OK]"
    else
        wdiff <(cat - <<<"$output") <(cat - <<<"$expected")
        echo -e "\n[FAIL]"
        ((err++))
    fi
done

exit $err
