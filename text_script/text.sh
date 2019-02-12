#!/bin/bash

if [ ! -f testi.txt ]
then
    echo "Luodaan testi.txt"
    touch testi.txt
fi

echo "Luetaan"
read TEXT
echo $TEXT >> testi.txt
echo ""
echo "Tiedoston sisältö"
cat testi.txt

function add_text () {
    echo "Luetaan"
    read TEXT
    echo $TEXT >> testi.txt
}

echo "y/n"
read VAL

if [ $VAL = y ]
then
    add_text
fi