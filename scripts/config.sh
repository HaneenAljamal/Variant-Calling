#!/bin/bash

# reference files
ref="/home/hannoneh90/variant-calling/supporting_files/hg38/hg38.fa"
known_sites="/home/hannoneh90/variant-calling/supporting_files/hg38/GCF_000001405.40.gz"

# directories
reads="/home/hannoneh90/variant-calling/reads"
aligned_reads="/home/hannoneh90/variant-calling/aligned_reads"
results="/home/hannoneh90/variant-calling/results"
data="/home/hannoneh90/variant-calling/data"
ref_dir="/home/hannoneh90/variant-calling/supporting_files/hg38"

# create directories
mkdir -p "$reads" "$aligned_reads" "$results" "$ref_dir" "$data"
