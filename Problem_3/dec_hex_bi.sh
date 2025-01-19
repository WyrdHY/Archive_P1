#!/bin/bash

# Function to convert decimal to hexadecimal
dec_to_hex_bi() {

    local number=$1

    echo "Input: decimal number is $number"

    if [ "$number" -ge 100000 ]; then
        echo "Output: The number is larger than 100000."
        return 1
    fi

    local temp=$1
    local temp2=0
    local result=()

    local hex_digits="0123456789ABCDEF"

    while [ $temp -gt 0 ]; do
        temp2=$((temp % 16))  # Calculate remainder
        result+=("${hex_digits:temp2:1}")  # Add corresponding hex digit
        temp=$((temp - temp2))  # Reduce the number
        temp=$((temp / 16))  # Divide by 16
    done

    # Reverse the result array and concatenate
    local hex_value=""
    for ((i=${#result[@]}-1; i>=0; i--)); do
        hex_value+="${result[i]}"
    done

    # If the number is 0, output "0"
    if [ -z "$hex_value" ]; then
        hex_value="0"
    fi
    #echo "$hex_value"

    local temp=$1
    local temp2=0
    local result=()
    local bin_digits="01"

    while [ $temp -gt 0 ]; do
        temp2=$((temp % 2))  # Calculate remainder
        result+=("${bin_digits:temp2:1}")  # Add corresponding binary digit
        temp=$((temp - temp2))  # Reduce the number
        temp=$((temp / 2))  # Divide by 2
    done

    # Reverse the result array and concatenate
    local bin_value=""
    for ((i=${#result[@]}-1; i>=0; i--)); do
        bin_value+="${result[i]}"
    done

    # If the number is 0, output "0"
    if [ -z "$bin_value" ]; then
        bin_value="0"
    fi

    echo "Output: "
    echo "bi: $bin_value"
    echo "hex: $hex_value"
    echo " "
    return 0
}
