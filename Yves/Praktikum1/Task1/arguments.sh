#!/bin/bash

#$ ./arguments.sh 1 2 3 'test string' "hallo welt"s

echo script name: $0
echo arguments: $1 - $2 - $3

#echo script name: $0
echo number of arguments: $#

for argument in "$@"
do
        echo "$argument"
done