#!/bin/bash

input_dir=$1
outpur_dir=$2

for input_file in $(find $input_dir -type f -maxdepth 1); do
	./cpg.sh $input_file $outpur_dir
done
