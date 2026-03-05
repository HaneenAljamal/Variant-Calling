#!/bin/bash

# directories
reads="/home/hannoneh90/variant-calling/reads"
aligned_reads="/home/hannoneh90/variant-calling/aligned_reads"
results="/home/hannoneh90/variant-calling/results"
data="/home/hannoneh90/variant-calling/data"
ref_dir="/home/hannoneh90/variant-calling/supporting_files/hg38"

# reference files
ref="/home/hannoneh90/variant-calling/supporting_files/hg38/hg38.fa"
known_sites="$ref_dir/dbsnp_hg38.vcf.gz"

# create directories
mkdir -p "$reads" "$aligned_reads" "$results" "$ref_dir" "$data"
