#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

echo "step 8: PASS variants extractcion"

bcftools view \
  -f PASS \
  $results/SRR062634.filtered_variants.vcf.gz \
  -Oz -o $results/SRR062634.pass_variants.vcf.gz
