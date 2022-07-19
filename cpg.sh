#!/bin/bash

input_dir=$1
output_dir=$2
output_fname=$3

# Extract functions
joern --script export.sc --params inputDirectory=$input_dir,outFile=$output_dir/$output_fname
