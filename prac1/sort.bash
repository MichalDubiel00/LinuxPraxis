##!/bin/bash
cd ~
for file in $HOME/*; do
    if [[ $file == *.sh  ]]; then
        mv "$file" "$HOME/linux.prak/prac1" 
    fi 
done;