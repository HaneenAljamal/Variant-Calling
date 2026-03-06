#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

if [ ! -f "$results/SRR062634.filtered_variants.vcf.gz" ]; then
    echo "Filtered VCF missing"
    exit 1
fi

echo "step 8: PASS variants extractcion"

bcftools view \
  -f PASS \
  $results/SRR062634.filtered_variants.vcf.gz \
  -Oz -o $results/SRR062634.pass_variants.vcf.gz
