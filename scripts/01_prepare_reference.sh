#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

# =========================
# Paths
# =========================


cd "$ref_dir"

# =========================
# 1. Download GATK-compatible reference FASTA (GRCh38)
# =========================
echo "Downloading reference genome..."

wget -c https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.40_GRCh38.p14/GCF_000001405.40_GRCh38.p14_genomic.fna.gz


gunzip GCF_000001405.40_GRCh38.p14_genomic.fna.gz

mv GCF_000001405.40_GRCh38.p14_genomic.fna hg38.fa
# =========================
# 2. Index FASTA (samtools)
# =========================
echo "Indexing FASTA..."
samtools faidx hg38.fa

# =========================
# 3. Create sequence dictionary (GATK)
# =========================
echo "Creating sequence dictionary..."
gatk CreateSequenceDictionary \
  -R hg38.fa \
  -O hg38.dict

# =========================
# 4. Download dbSNP (known sites for BQSR)
# =========================
echo "4a. Downloading dbSNP known sites..."

wget -c https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/GCF_000001405.40.gz
tabix -p vcf GCF_000001405.40.gz


# =========================
# 5. Sanity checks
# =========================
echo "Checking contig compatibility..."
bcftools view -h GCF_000001405.40.gz | grep "^##contig" | head
grep "^>" hg38.fa | head

# =========================
# 6. Indexing reference with BWA
# =========================

if [ ! -f "${ref}.bwt" ]; then
    echo "Indexing reference with BWA..."
    bwa index "$ref"
else
    echo "BWA index already exists. Skipping."
fi

# =========================
echo "Reference preparation completed successfully ✅"
