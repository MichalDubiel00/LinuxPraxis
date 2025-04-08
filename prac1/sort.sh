##!/bin/bash
string=""

for file in "$HOME/linux.prak/prac1/keydir"/*; do
if [[ $file == *.pub  ]]; then
    string+=$(basename "${file%.*}")" "
    fi 
done
echo "$string"