#!/bin/bash
valid=false
re='^[0-9]+$'
Array=("add" "sub" "mult" "div" "cross" "-help")

if (( $# < 1 )); then
    echo "No arguments -> use the -help as your first argument!"
    exit 1
elif (( $# > 3 )); then
    echo "There are to many arguments! Max 3 arguments"
    exit 1
fi

for input in ${Array[@]}; do
    if [ "$input" == "$1" ]; then
        operation="$input"
        valid=true
        break
    fi
done

echo "operation:  "${operation}
echo 

if [ "$valid" == "false" ]; then
    echo "The first Argument is wrong! use the -help"
    exit 1
fi

if [ "$1" == "-help" ]; then
    echo "Possible first arguments are: add, sub, mult, div or cross"
    exit 1
fi



if [ "$operation" == "cross" ] && (( $# < 3 )); then 
    if (( $# == 1 )); then 
        read -p "Enter an Integer Number: " crosssum
        if ! [[ $crosssum =~ $re ]]; then
            echo
            echo "Please input an Integer Number!"
            exit 1
        fi
    else
        crosssum=$2
    fi

    sum=0

    while [ $crosssum -gt 0 ]
    do
        mod=$((crosssum % 10))    #It will split each digits
        sum=$((sum + mod))   #Add each digit to sum
        crosssum=$((crosssum / 10))    #divide num by 10.
    done

    echo "The cross sum is: " ${sum}
    exit 1
elif [ "$operation" == "cross" ] && (( $# == 3 )); then
    echo "the cross Tag only takes 1 argument!"
    exit 1
fi

if (( $# == 1 )); then 
    read -p "Enter the first Number: " number1
    if ! [[ $number1 =~ $re ]]; then
        echo
        echo "Please input an Integer as your first Number!"
        exit 1
    fi

    read -p "Enter the second Number: " number2
    if ! [[ $number2 =~ $re ]]; then
        echo
        echo "Please input an Integer as your second Number!"
        exit 1
    fi
    echo
elif ! [[ $2 =~ $re ]]; then
    echo "The second argument needs to be an Integer!";
    exit 1
elif ! [[ $3 =~ $re ]]; then
    echo "The third argument needs to be an Integer!";
    exit 1
else
    number1=$2
    number2=$3
fi

if [ "$operation" == "add" ]; then
    echo  ${number1} + ${number2} = $((number1+number2))
elif [ "$operation" == "sub" ]; then
    echo  ${number1} - ${number2} = $((number1-number2))
elif [ "$operation" == "mult" ]; then
    echo  ${number1} "*" ${number2} = $((number1*number2))
elif [ "$operation" == "div" ]; then
    echo  ${number1} / ${number2} = $((number1/number2))
fi
