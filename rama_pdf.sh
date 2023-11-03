#!/bin/bash

# Directory containing .pdb input files
input_dir="/home/molprobity/AF_results/"

# Check if the input directory exists
if [ ! -d "$input_dir" ]; then
    echo "Input directory $input_dir does not exist."
    exit 1
fi
# Loop through .pdb files in the input directory
for input_file in "$input_dir"/*.pdb; do
    if [ -f "$input_file" ]; then
        # Extract the filename without the path and extension
        input_filename=$(basename -- "$input_file")
        # Run the script with the current input file and save the output
        /home/molprobity/molprobity/cmdline/rama_chart_pdf "$input_file"
    fi
done