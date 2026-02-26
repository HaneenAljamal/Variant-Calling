#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"


fastqc -t 4 ${reads}/SRR062634_1.fastq.gz ${reads}/SRR062634_2.fastq.gz -o ${reads}

#no trimming required ... the quality looks ok
