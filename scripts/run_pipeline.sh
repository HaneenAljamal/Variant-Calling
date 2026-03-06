#!/bin/bash
set -euo pipefail

mkdir -p logs

# Activate your conda environment
echo "Activating conda environment 'gatk'..."
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate gatk

echo "Starting pipeline..."

bash scripts/00_download_data.sh 2>&1 | tee >(while read line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > logs/00_download_data.log)
bash scripts/01_prepare_reference.sh 2>&1 | tee >(while read line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > logs/01_prepare_reference.log)
bash scripts/02_fastqc.sh 2>&1 | tee >(while read line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > logs/02_fastqc.log)
bash scripts/03_alignment_bwa.sh 2>&1 | tee >(while read line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > logs/03_alignment_bwa.log)
bash scripts/04_mark_duplicates.sh 2>&1 | tee >(while read line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > logs/04_mark_duplicates.log)
bash scripts/05_bqsr.sh 2>&1 | tee >(while read line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > logs/05_bqsr.log)
bash scripts/06_variant_calling.sh 2>&1 | tee >(while read line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > logs/06_variant_calling.log
bash scripts/07_variant_filtering.sh 2>&1 | tee >(while read line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > logs/07_variant_filtering.log
bash scripts/08_select_pass_variants.sh 2>&1 | tee >(while read line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > logs/08_select_pass_variants.log
bash scripts/09_annotation.sh 2>&1 | tee >(while read line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > logs/09_annotation.log
bash scripts/10_variant_statistics.sh 2>&1 | tee >(while read line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > logs/10_variant_statistics.log
bash scripts/11_generate_report.sh 2>&1 | tee >(while read line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > logs/11_generate_report.log

echo "Pipeline finished successfully"
