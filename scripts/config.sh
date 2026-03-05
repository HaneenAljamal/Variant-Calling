#!/bin/bash

# project root
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

# directories
ref_dir="$PROJECT_DIR/supporting_files/hg38"
reads="$PROJECT_DIR/reads"
aligned_reads="$PROJECT_DIR/aligned_reads"
results="$PROJECT_DIR/results"
data="$PROJECT_DIR/data"

# reference files
ref="$ref_dir/hg38.fa"
known_sites="$ref_dir/dbsnp_hg38.vcf.gz"

# create directories
mkdir -p "$reads" "$aligned_reads" "$results" "$ref_dir" "$data"
