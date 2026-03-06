#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

echo "Running HaplotypeCaller..."

gatk HaplotypeCaller \
  -R $ref \
  -I $aligned_reads/SRR062634.sorted.markdup.bqsr.bam \
  -O $results/SRR062634.raw_variants.vcf.gz \
  -ERC GVCF
