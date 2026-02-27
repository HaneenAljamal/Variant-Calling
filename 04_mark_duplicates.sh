#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

echo "Step 4: Mark duplicates"

# input and output
input_bam="$aligned_reads/SRR062634.sorted.bam"
output_bam="$aligned_reads/SRR062634.sorted.markdup.bam"
metrics_file="$aligned_reads/SRR062634.markdup.metrics.txt"

# mark duplicates
gatk MarkDuplicates \
  -I "$input_bam" \
  -O "$output_bam" \
  -M "$metrics_file" \
  --CREATE_INDEX true

echo "MarkDuplicates completed successfully"
