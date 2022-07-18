#!/bin/bash

input_file=$1 		# "/tmp/main.cpp"
output_dir=$2		# "/tmp/out/"
name=$(basename $input_file | cut -d'.' -f1)
output_file="$output_dir/$name.jsonl"

#temp_dir=$(mktemp -d)
#temp_file="$temp_dir/out.cpg"
#
## Parse source code file
#joern-parse -o $temp_file $input_file

# Export function
joern --script export.sc --params inputFile=$input_file,outFile=$output_file

#rm -rf $temp_dir
