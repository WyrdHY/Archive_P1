#!/bin/bash

alias file_remove='function _file_remove() { 
    if [ -d "$1" ]; then
        rm -f "$1"/*.bin && echo "Removed all .bin files from $1."
    else
        echo "Error: Directory $1 does not exist."
    fi
}; _file_remove'