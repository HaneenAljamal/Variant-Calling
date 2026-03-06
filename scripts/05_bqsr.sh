#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

if [ ! -f "$aligned_reads/SRR062634.sorted.markdup.bam" ]; then
    echo "ERROR: MarkDuplicates output missing"
    exit 1
fi

echo "Step 5a: Building recalibration model (BaseRecalibrator)"

gatk BaseRecalibrator \
  -I ${aligned_reads}/SRR062634.sorted.markdup.bam \
  -R ${ref} \
  --known-sites ${known_sites} \
  -O ${data}/recal_data.table

echo "Step 5b: Applying recalibration (ApplyBQSR)"

gatk ApplyBQSR \
  -I ${aligned_reads}/SRR062634.sorted.markdup.bam \
  -R ${ref} \
  --bqsr-recal-file ${data}/recal_data.table \
  -O ${aligned_reads}/SRR062634.sorted.markdup.bqsr.bam

echo "Indexing recalibrated BAM"
samtools index ${aligned_reads}/SRR062634.sorted.markdup.bqsr.bam
