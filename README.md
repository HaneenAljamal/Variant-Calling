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


## Pipeline Steps

1. Reference genome preparation
2. Quality control using FastQC
3. Read alignment using BWA-MEM
4. Sorting alignments
5. Marking PCR duplicates
6. Base Quality Score Recalibration (BQSR)

## Tools Used

* BWA
* SAMtools
* GATK
* bcftools
* FastQC

## Project Structure

variant-calling/

scripts/

reads/

aligned_reads/

results/

data/

supporting_files/hg38/

## Running the Pipeline

Clone the repository:

git clone https://github.com/HaneenAljamal/Variant-Calling.git

cd variant-calling

Run the pipeline:

bash scripts/run_pipeline.sh

## Example Dataset

The pipeline currently uses the SRA dataset:

SRR062634

Data should be downloaded to $reads folder (check 00_download_data.sh script)

## Output Files

The main outputs include:

* aligned BAM files
* duplicate-marked BAM files
* recalibrated BAM files

