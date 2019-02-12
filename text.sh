# Yhta yksinkertainen kuin tekijansa -tekstieditori
if [ ! -f text.txt ]
then
        echo File not found: creating
        touch text.txt
fi
echo Input text to append type /q to quit, /r to read, /rs *string to remove lines with *string or /e to erase file content:
read TEXT
while [[ $TEXT != "/q" ]]; do
  if [[ $TEXT == "/e" ]]; then
    truncate -s 0 text.txt
    echo Erased file content
  elif [[ $TEXT == "/r" ]]; then
    echo File content:
    cat text.txt
  elif [[ $TEXT == "/rs" ]]; then
    echo Input part of the line to remove
    read TEXT
    echo "$(grep -v "$TEXT" text.txt)" >text.txt
    echo Erased lines containing: $TEXT
  elif [[ $TEXT == /rs* ]]; then
    TEXT=${TEXT#"/rs "}
    echo "$(grep -v "$TEXT" text.txt)" >text.txt
    echo Erased lines containing: $TEXT
  else
    echo $TEXT >> text.txt
  fi
  read TEXT
done
