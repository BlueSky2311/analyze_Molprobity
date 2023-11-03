#!/bin/bash

# Directory containing .pdb input files
input_dir="/home/molprobity/AF_results/"

# Directory to save output files
output_dir="/home/molprobity/analyzed_results/Clash_score/"

# Check if the input directory exists
if [ ! -d "$input_dir" ]; then
    echo "Input directory $input_dir does not exist."
    exit 1
fi

# Create the output directory if it doesn't exist
if [ ! -d "$output_dir" ]; then
    mkdir -p "$output_dir"
fi

# Loop through .pdb files in the input directory
for input_file in "$input_dir"/*.pdb; do
    if [ -f "$input_file" ]; then
        # Extract the filename without the path and extension
        input_filename=$(basename -- "$input_file")
        input_filename_noext="${input_filename%.pdb}"

        # Define the corresponding output file path
        output_file="$output_dir/${input_filename_noext}.out"

        # Run the script with the current input file and save the output
        /home/molprobity/molprobity/cmdline/clashscore "$input_file" > "$output_file"
    fi
done