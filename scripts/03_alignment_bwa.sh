#!/bin/bash

set -euo pipefail

source "$(dirname "$0")/config.sh"

echo "Step 3: Align reads with BWA-MEM"

bwa mem -t 4 \
  -R "@RG\tID:SRR062634\tPL:ILLUMINA\tSM:SRR062634" \
  "$ref" \
  "$reads"/SRR062634_1.fastq.gz \
  "$reads"/SRR062634_2.fastq.gz \
| samtools view -bS - \
|samtools sort -@ 2 -m 2G \
  -o "$aligned_reads/SRR062634.sorted.bam"

echo "Alignment completed successfully"
