#!/bin/bash

reads="reads"

fastqc -t 4 ${reads}/SRR062634_1.fastq.gz ${reads}/SRR062634_2.fastq.gz -o ${reads}

#no trimming required ... the quality looks ok
