#!/bin/bash

input_dir=$1
output_dir=$2
output_fname=$3

total=$(find $input_dir -type f | wc -l)
i=0

# Extract functions
for input_file in $(find $input_dir -type f); do
	i=$((i + 1))
	echo "$i / $total"
	joern --script export.sc --params inputFile=$input_file,outFile=$output_dir/$output_fname
done
