# Variant Calling Pipeline

This repository contains a WGS/WES variant calling pipeline using:
- FastQC
- BWA
- samtools
- GATK

Environment: WSL2 + Conda (Ubuntu)

## Tutorial source

This pipeline is based on and adapted from the following YouTube tutorial:

- https://www.youtube.com/watch?v=iHkiQvxyr5c

The implementation has been restructured for reproducibility, clarity, and best practices.


# Pipeline Overview

FASTQ
 ↓
FastQC
 ↓
Alignment (BWA)
 ↓
Mark Duplicates
 ↓
Base Quality Score Recalibration (BQSR)
 ↓
Variant Calling (HaplotypeCaller)
 ↓
Variant Filtering
 ↓
Variant Annotation

## Installation

conda env create -f environment.yml
conda activate gatk

## Tools Used

* BWA
* SAMtools
* GATK
* bcftools
* FastQC

## Project Structure
scripts/
reads/
aligned_reads/
results/
supporting_files/
logs/


## Running the Pipeline

Clone the repository:

git clone https://github.com/HaneenAljamal/Variant-Calling.git

cd variant-calling

Run the pipeline:

bash scripts/run_pipeline.sh

## Example Dataset

The pipeline currently uses the SRA dataset:

SRR062634

Data is automatically downloaded into the `reads/` directory using:

scripts/00_download_data.sh

## Output Files

results/
 ├── SRR062634.raw_variants.vcf.gz
 ├── SRR062634.filtered_variants.vcf.gz
 └── SRR062634.annotated.vcf
