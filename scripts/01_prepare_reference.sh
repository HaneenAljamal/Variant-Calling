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

wget -c https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_44/GRCh38.primary_assembly.genome.fa.gz

gunzip -f GRCh38.primary_assembly.genome.fa.gz
mv GRCh38.primary_assembly.genome.fa hg38.fa

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
echo "Downloading dbSNP known sites..."

wget -c https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/GCF_000001405.40.gz
tabix -p vcf GCF_000001405.40.gz

# =========================
# 5. Sanity checks
# =========================
echo "Checking contig compatibility..."

bcftools view -h GCF_000001405.40.gz | grep "^##contig" | head
grep "^>" hg38.fa | head

echo "Reference preparation completed successfully ✅"
