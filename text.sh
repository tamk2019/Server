#!/bin/bash

if ( ! -f texti.txt)
then
        echo tiedostoa ei ole: luodaan.
        touch texti.txt
fi
TEXT=
echo what text you want to append.
read s- TEXT

echo "$TEXT" >> texti.txtyk

echo $TEXT, appended

