Bash commands used to help determine strandedness:

```bash
grep -v "^__" htseq-counts_CcoxCrh_comrhy59_EO_6cm_1/CcoxCrh_comrhy59_EO_6cm_1_htseqcounts_forstranded.txt | awk '{sum+=$2} END {print sum}'
awk '{sum+=$2} END {print sum}' htseq-counts_CcoxCrh_comrhy59_EO_6cm_1/CcoxCrh_comrhy59_EO_6cm_1_htseqcounts_forstranded.txt

grep -v "^__" htseq-counts_CcoxCrh_comrhy59_EO_6cm_1/CcoxCrh_comrhy59_EO_6cm_1_htseqcounts_revstranded.txt | awk '{sum+=$2} END {print sum}'
awk '{sum+=$2} END {print sum}' htseq-counts_CcoxCrh_comrhy59_EO_6cm_1/CcoxCrh_comrhy59_EO_6cm_1_htseqcounts_revstranded.txt
```

711218 / 33997802 = 0.0209

11027898 / 33997802 = 0.3244

reverse has higher percent mapped

```bash
grep -v "^__" htseq-counts_CcoxCrh_comrhy113_EO_adult_2/CcoxCrh_comrhy113_EO_adult_2_htseqcounts_forstranded.txt | awk '{sum+=$2} END {print sum}'
awk '{sum+=$2} END {print sum}' htseq-counts_CcoxCrh_comrhy113_EO_adult_2/CcoxCrh_comrhy113_EO_adult_2_htseqcounts_forstranded.txt
grep -v "^__" htseq-counts_CcoxCrh_comrhy113_EO_adult_2/CcoxCrh_comrhy113_EO_adult_2_htseqcounts_revstranded.txt | awk '{sum+=$2} END {print sum}'
awk '{sum+=$2} END {print sum}' htseq-counts_CcoxCrh_comrhy113_EO_adult_2/CcoxCrh_comrhy113_EO_adult_2_htseqcounts_revstranded.txt
```

654234 / 30688755 = 0.0213

9165480 / 30688755 = 0.2987

reverse has higher percent mapped