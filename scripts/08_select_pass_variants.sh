bcftools view \
  -f PASS \
  $results/SRR062634.filtered_variants.vcf.gz \
  -Oz -o $results/SRR062634.pass_variants.vcf.gz
