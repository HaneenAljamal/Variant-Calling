# Variant Calling Tutorial Pipeline

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
```
FASTQ
 ↓
Quality Control (FastQC)
 ↓
Alignment (BWA-MEM)
 ↓
Sorting & Mark Duplicates
 ↓
Base Quality Score Recalibration (BQSR)
 ↓
Variant Calling (GATK HaplotypeCaller)
 ↓
Variant Filtering
 ↓
PASS Variant Selection
 ↓
Variant Annotation
 ↓
Variant Statistics
 ↓
Report Generation
```

## Tools Used

* BWA
* SAMtools
* GATK
* bcftools
* FastQC

## Configuration

Pipeline paths and variables are defined in:
```
scripts/config.sh
```

## Project Structure
```
Variant-Calling/
├── README.md
├── environment.yml
├── .gitignore
│
├── scripts/
│   ├── config.sh
│   ├── run_pipeline.sh
│   ├── 00_download_data.sh
│   ├── 01_prepare_reference.sh
│   ├── 02_fastqc.sh
│   ├── 03_alignment_bwa.sh
│   ├── 04_mark_duplicates.sh
│   ├── 05_bqsr.sh
│   ├── 06_variant_calling.sh
│   ├── 07_variant_filtering.sh
│   ├── 08_select_pass_variants.sh
│   ├── 09_annotation.sh
│   ├── 10_variant_statistics.sh
│   └── 11_generate_report.sh
│
├── reads/              # FASTQ files
├── aligned_reads/      # BAM files
├── results/            # VCF outputs
├── data/               # intermediate files (BQSR tables etc.)
├── supporting_files/   # reference genome + dbSNP
└── logs/               # pipeline logs
```

### Input Requirements

The pipeline expects a single FASTQ file placed in the `reads/` directory.

## Running the Pipeline

Clone the repository:
```
git clone https://github.com/HaneenAljamal/Variant-Calling.git

cd Variant-Calling
```
Add Your FASTQ File
```
cp sample.fastq.gz reads/
```
Create the environment:
```
conda env create -f environment.yml
conda activate gatk
```

Run the pipeline:
```
bash scripts/run_pipeline.sh
```
## Example Dataset

The pipeline currently uses the SRA dataset:

SRR062634

Data is automatically downloaded into the `reads/` directory using:
```
scripts/00_download_data.sh
```

## Example Output 
```
aligned_reads/
 ├── SRR062634.sorted.bam
 ├── SRR062634.sorted.markdup.bam
 └── SRR062634.sorted.markdup.bai

results/
 ├── SRR062634.raw_variants.vcf.gz
 ├── SRR062634.filtered_variants.vcf.gz
 ├── SRR062634.pass_variants.vcf.gz
 ├── SRR062634.annotated.vcf
 └── variant_statistics.txt

logs/
 ├── 01_prepare_reference.log
 ├── 02_fastqc.log
 ├── ...
```
