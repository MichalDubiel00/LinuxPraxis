#!/bin/bash

sum_digits() {
  local num=$1
  local sum=0
  while [ $num -gt 0 ]; do
    sum=$((sum + num % 10)) 
    num=$((num / 10))
  done
  echo $sum
}

$1 $2 $3

check= false;

operations=("add" "sub" "mult" "div" "cross")
    echo $1

    if [[ $1 = "-help" ]]; then
        echo "use 3 arguments first argument has to be either
        
        “add” (addition)

        “sub” (subtraction)

        “mult” (multiplication)

        “div” (division)

        “cross” (cross sum)

        2nd and 3rd are integers to be calculated
"
fi

if (($# < 2)); then
echo use -help for help
exit 1
fi

if [[ ! "$2" =~ ^-?[0-9]+$ ]]; then
    echo "$2 is not an integer. Exiting."
    exit 1
fi

for op in ${operations[@]}; do
    if [ $1 == op  ]; then
        check= true
        fi
done

case $1 in 

"add")
if (($# == 2)); then
echo need 3 arguments
fi
exit 1
echo $2 '+' $3 '=' $(($2+$3))
;;
"sub")
if (($# == 2)); then
echo need 3 arguments
fi
echo $2 '-' $3 '=' $(($2-$3))
;;
"mult")
if (($# == 2)); then
echo need 3 arguments
fi
echo $2 '*' $3 '=' $(($2*$3))
;;
"div")
if (($# == 2)); then
echo need 3 arguments
fi
echo $2 '/' $3 '=' $(($2/$3))
;;
"cross")
sum1=$(sum_digits $2)
if (($# == 2)); then
echo cross sum = $sum1
fi
if (($# > 2)); then
if [[ ! "$3" =~ ^-?[0-9]+$ ]]; then
    sum2=$(sum_digits $3)
    echo "$3 is not an integer. Exiting."
    exit 1  
    fi
echo cross sum = $sum2
fi


;;

esac


if [[ check == false ]]; then 
echo wrong operation
echo use -help for help
exit 1 
fi
