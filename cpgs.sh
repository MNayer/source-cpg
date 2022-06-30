#!/bin/bash

input_dir=$1
outpur_dir=$2
total=$(find $input_dir -maxdepth 1 -type f | wc -l)
current=0

for input_file in $(find $input_dir -maxdepth 1 -type f); do
	current=$(( $current + 1 ))
	echo "Process file $current / $total"
	./cpg.sh $input_file $outpur_dir
done
