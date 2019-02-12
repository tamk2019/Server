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

while true
echo "y/n"
read VAL
do
if [ $VAL = y ]
then
    add_text
else if [ $VAL = n ]
then
    exit
else if [ $VAL = r ]
then
    rm -rf testi.txt
    echo "Tiedosto poistettu"
fi
fi
fi
done