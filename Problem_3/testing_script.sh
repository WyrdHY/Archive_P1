#!/bin/bash

# Path to the conversion script
conversion_script="dec_hex_bi.sh"

# Source the conversion script
if [ -f "$conversion_script" ]; then
    source "$conversion_script"
else
    echo "Error: Conversion script not found at $conversion_script"
    exit 1
fi

# Directory and file for results
output_file="conversion_result.txt"

# Create the output directory if it doesn't exist

# Define the set of decimal values to test
test_values=(1 15 16 31 488 1000 99999 200000)

# Clear the output file
> "$output_file"

# Loop through test values and process each
for value in "${test_values[@]}"; do
    result=$(dec_to_hex_bi "$value")
    echo "$result" >> "$output_file"
done

echo "Conversion results saved to $output_file."
