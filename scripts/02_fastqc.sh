#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

if [ ! -f "$reads/SRR062634_1.fastq" ]; then
    echo "Reads not found. Run 00_download_data.sh first."
    exit 1
fi

echo "Step 2: Running FastQC"

fastqc -t 4 ${reads}/SRR062634_1.fastq.gz ${reads}/SRR062634_2.fastq.gz -o ${reads}

#no trimming required ... the quality looks ok
