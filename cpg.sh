#!/bin/bash

input_dir=$1
output_dir=$2

total=$(find $input_dir -type f | wc -l)
i=0

joern --script export.sc --params inputDir=$input_dir,outputDir=$output_dir
#
## Extract functions
#for input_file in $(find $input_dir -type f); do
#	output_fname=$(basename $input_file | cut -d'.' -f1)
#	i=$((i + 1))
#	echo "$i / $total"
#	joern --script export.sc --params inputDir=$input_dir
#done
