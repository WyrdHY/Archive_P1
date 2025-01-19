#!/bin/bash

data_dir="/root/Desktop/Phys129AL/PS1/P2/P2/Problem1/electron_scattering_data"

mkdir -p "$data_dir/odd" "$data_dir/even"

for file in "$data_dir"/*; do
    if [[ -f "$file" ]]; then
        index=$(echo "$file" | grep -oP '(?<=_index_)[0-9]+')

        if [[ -n "$index" ]]; then
            if (( index % 2 == 0 )); then
                mv "$file" "$data_dir/even/"
            else
                mv "$file" "$data_dir/odd/"
            fi
        else
            echo "Warning: Could not extract index from file $file"
        fi
    fi
done

echo "Files successfully sorted into 'odd' and 'even' directories."