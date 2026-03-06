#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

echo "step 10: variant statistics"

bcftools stats $results/SRR062634.pass_variants.vcf.gz > $results/variant_stats.txt
