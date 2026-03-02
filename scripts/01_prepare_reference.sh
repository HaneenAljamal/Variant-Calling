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
echo "4a. Downloading dbSNP known sites..."

wget -c https://ftp.ncbi.nlm.nih.gov/snp/latest_release/VCF/GCF_000001405.40.gz

# =========================
# 4b. Create contig rename map (NCBI → UCSC chr)
# =========================
echo "Creating contig rename map for dbSNP..."

cat > ncbi_to_chr.txt << 'EOF'
NC_000001.11	chr1
NC_000002.12	chr2
NC_000003.12	chr3
NC_000004.12	chr4
NC_000005.10	chr5
NC_000006.12	chr6
NC_000007.14	chr7
NC_000008.11	chr8
NC_000009.12	chr9
NC_000010.11	chr10
NC_000011.10	chr11
NC_000012.12	chr12
NC_000013.11	chr13
NC_000014.9	chr14
NC_000015.10	chr15
NC_000016.10	chr16
NC_000017.11	chr17
NC_000018.10	chr18
NC_000019.10	chr19
NC_000020.11	chr20
NC_000021.9	chr21
NC_000022.11	chr22
NC_000023.11	chrX
NC_000024.10	chrY
NC_012920.1	chrM
EOF

# =========================
# 4c. Rename dbSNP contigs to match hg38 reference
# =========================
echo "Renaming dbSNP contigs to chr-style..."

bcftools annotate \
  --rename-chrs ncbi_to_chr.txt \
  GCF_000001405.40.gz \
  -Oz -o dbsnp_hg38_chr.vcf.gz

tabix -p vcf dbsnp_hg38_chr.vcf.gz



# =========================
# 5. Sanity checks
# =========================
echo "Checking contig compatibility..."
bcftools view -h dbsnp_hg38_chr.vcf.gz | grep "^##contig" | head
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
