#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

if [ ! -f "$results/SRR062634.pass_variants.vcf.gz" ]; then
    echo "PASS variants file missing"
    exit 1
fi

echo "step 9: annotation"

  snpEff GRCh38.p14 \
$results/SRR062634.pass_variants.vcf.gz \
-o vcf \
> $results/SRR062634.annotated.vcf
