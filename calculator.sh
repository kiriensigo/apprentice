#!/bin/bash

echo "Enter two numbers:"
read num1
read num2

if ! [[ "$num1" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$num2" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
	echo "Invalid input. Please enter numbers only"
	exit 1
fi

echo "Choose an artithmetic operation (+,-,*,/):"
read operation

case $operation in
	"+")
	result=$(echo "$num1 + $num2" | bc)
	;;
	"-")
        result=$(echo "$num1 - $num2" | bc)
        ;;
    	"*")
       	result=$(echo "$num1 * $num2" | bc)
       	;;
    	"/")
       	if [ "$num2" = "0" ]; then
          	echo "Division by zero is not allowed!"
            	exit 1
        fi
        result=$(echo "scale=2; $num1 / $num2" | bc)
        ;;
    	*)
        	echo "Invalid operation! Please choose one of (+, -, *, /)."
        	exit 1
        ;;
esac

echo "The result: $result"
