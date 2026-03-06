#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

echo "step 9: annotation"

snpEff GRCh38.105 \
  $results/SRR062634.pass_variants.vcf.gz \
  > $results/SRR062634.annotated.vcf
