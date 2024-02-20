onexit() {
    rm -f pipe
}
trap onexit EXIT
if [[ ! -p pipe ]]; then
    mkfifo pipe
fi

pwd
cat - <<<"INPUT" >pipe &
output=$(./run.sh pipe)
cat - <<<"$output"

if [[ "$output" != "ANSWERINPUT" ]]
then
    exit 1
fi
