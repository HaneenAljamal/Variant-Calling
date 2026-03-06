#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/config.sh"

echo "Generating pipeline report..."

report="$results/pipeline_report.txt"

echo "Pipeline Report" > $report
echo "===============" >> $report
echo "" >> $report

echo "Sample: SRR062634" >> $report
echo "Reference genome: GRCh38" >> $report
echo "" >> $report

echo "Input reads:" >> $report
ls $reads >> $report
echo "" >> $report

echo "Aligned BAM:" >> $report
ls $aligned_reads/*.bam >> $report
echo "" >> $report

echo "Variant files:" >> $report
ls $results/*.vcf* >> $report
echo "" >> $report

echo "Pipeline completed successfully." >> $report

echo "Report saved to $report"
