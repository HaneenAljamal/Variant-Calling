#!/bin/bash
set -euo pipefail

base="$HOME/variant-calling"
reads="$base/reads"

mkdir -p "$reads"

wget -c -P "$reads" \
https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR062/SRR062634/SRR062634_1.fastq.gz

wget -c -P "$reads" \
https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR062/SRR062634/SRR062634_2.fastq.gz


