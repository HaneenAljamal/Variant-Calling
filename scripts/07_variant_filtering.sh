#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

if [ ! -f "$results/SRR062634.raw_variants.vcf.gz" ]; then
    echo "Raw VCF not found"
    exit 1
fi

echo "step 7: variant filtering"

gatk VariantFiltration \
  -R $ref \
  -V $results/SRR062634.raw_variants.vcf.gz \
  -O $results/SRR062634.filtered_variants.vcf.gz \
  --filter-name "QD_filter" --filter-expression "QD < 2.0" \
  --filter-name "FS_filter" --filter-expression "FS > 60.0" \
  --filter-name "MQ_filter" --filter-expression "MQ < 40.0"
