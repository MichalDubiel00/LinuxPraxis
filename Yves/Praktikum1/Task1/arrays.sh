#!/bin/bash

MyArray=("Element 1" "Element 2" 42 1337)

#echo $MyArray[0]
#echo $MyArray[1]
#echo $MyArray[2]
#echo $MyArray[3]

echo ${MyArray[0]}
echo ${MyArray[1]}
echo ${MyArray[2]}
echo ${MyArray[3]}

MyArray[3]="UpdatedContent"
MyArray[4]="AppendedContent"

echo ${MyArray[0]}
echo ${MyArray[1]}
echo ${MyArray[2]}
echo ${MyArray[3]}
echo ${MyArray[4]}

echo ${#MyArray[0]}
echo ${#MyArray[1]}
echo ${#MyArray[2]}
echo ${#MyArray[3]}
echo ${#MyArray[4]}

echo ${#MyArray[@]}

echo "print array using loop:"
for j in ${MyArray[@]}; do

    if (( ${#j} < 10 )); then
        echo ${j}
    fi        
done

