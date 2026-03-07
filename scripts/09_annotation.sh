#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

if [ ! -f "$results/SRR062634.pass_variants.vcf.gz" ]; then
    echo "PASS variants file missing"
    exit 1
fi

#!/bin/bash

echo "step 9: annotation"

results="results"

# Convert NCBI RefSeq chromosome names (NC_000001.11) to Ensembl style (1)
# snpEff GRCh38 database expects chromosomes 1–22

bcftools annotate \
--rename-chrs <(cat <<EOF
NC_000001.11 1
NC_000002.12 2
NC_000003.12 3
NC_000004.12 4
NC_000005.10 5
NC_000006.12 6
NC_000007.14 7
NC_000008.11 8
NC_000009.12 9
NC_000010.11 10
NC_000011.10 11
NC_000012.12 12
NC_000013.11 13
NC_000014.9 14
NC_000015.10 15
NC_000016.10 16
NC_000017.11 17
NC_000018.10 18
NC_000019.10 19
NC_000020.11 20
NC_000021.9 21
NC_000022.11 22
EOF
) \
$results/SRR062634.pass_variants.vcf.gz \
-Ov \
-o $results/SRR062634.renamed.vcf

# Run annotation
snpEff -Xmx4g GRCh38.p14 \
$results/SRR062634.renamed.vcf \
> $results/SRR062634.annotated.vcf
