#!/bin/bash
MyArray=("Element 1" "Element 2" 42 1337)

#echo $MyArray[0]
#echo $MyArray[1]
#echo $MyArray[2]
#echo $MyArray[3]

MyArray[3]="UpdatedContent"
MyArray[4]="AppendedContent"
#
#echo ${MyArray[0]}
#echo ${MyArray[1]}
#echo ${MyArray[2]}
#echo ${MyArray[3]}
#echo ${MyArray[4]}
#
#echo ${#MyArray[@]}

echo "Var shorter then 10"
for var in ${MyArray[@]};
do
    if (( ${#var} < 10 )); then

echo ${var} 
fi
done

echo "con loop index modulo 2"

for ((idx=0;idx<${#MyArray[@]};++idx)); do
    if ((idx % 2 == 0)); then
        echo "modulo2"
        echo ${MyArray[idx]}

    else
         echo "modulo1"
        echo ${MyArray[idx]}
    fi
done
