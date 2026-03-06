#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

if [ ! -f "$results/SRR062634.pass_variants.vcf.gz" ]; then
    echo "PASS VCF not found"
    exit 1
fi

echo "step 10: variant statistics"

bcftools stats $results/SRR062634.pass_variants.vcf.gz > $results/variant_stats.txt
