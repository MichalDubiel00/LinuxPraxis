#!/bin/bash

echo "While:"
i=1
while [ "$i" -lt "11" ]; do   # if i less than 11
        echo "$i"
        let "i+=1"  # counter up, i=$i+1 can also be shortened to i+=1
done

echo "For:"
for j in {1..10}; do
        echo $j
done