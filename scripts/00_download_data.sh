#!/bin/bash

# Download paired-end FASTQ files from 1000 Genomes (HG00096)
mkdir -p reads

wget -P reads \
ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/phase3/data/HG00096/sequence_read/SRR062634_1.filt.fastq.gz

wget -P reads \
ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/phase3/data/HG00096/sequence_read/SRR062634_2.filt.fastq.gz
