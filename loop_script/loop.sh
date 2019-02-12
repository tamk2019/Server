#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
FILENAME="${SCRIPT_DIR}/teksti.txt"

if [ ! -f ${FILENAME} ]; then
    echo "File not found! Creating..."
    touch ${FILENAME}
fi

echo "Writing to file ${FILENAME}"

function write () {
    echo "Soitan huuliharppua wowowowowowow" >> ${FILENAME}
    echo "Tanssi voi jatkua" >> ${FILENAME}
    echo "Mutta... Vihellän vielä kerran!" >> ${FILENAME}
    echo ".--..--..--.-.-.--.--" >> ${FILENAME}
}

COUNT=5

if [ -n "$1" ]; then
    COUNT=${1}
fi

for i in $(eval echo {0..$COUNT})
do
   write
done

echo "Finished."
