#!/bin/bash

input_dir=$1
output_dir=$2
output_fname=$3

docker run -v $input_dir:/in -v $output_dir:/out --rm source-cpg ./cpg.sh /in /out $output_fname
