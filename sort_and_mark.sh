#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --time=12:00:00
#SBATCH --mail-user=bcorwin@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=sort_and_mark
#SBATCH --output=logs/sort_and_mark_logs/sort_and_mark_%j.out
#SBATCH --error=logs/sort_and_mark_logs/sort_and_mark_%j.err

file1="Alignments_CcoxCrh_comrhy59_EO_6cm_1.STAR_2.7.11b/CcoxCrh_comrhy59_EO_6cm_1.STAR_2.7.11b.Aligned.out"
file2="Alignments_CcoxCrh_comrhy113_EO_adult_2.STAR_2.7.11b/CcoxCrh_comrhy113_EO_adult_2.STAR_2.7.11b.Aligned.out"

conda activate QAA


/usr/bin/time -v samtools sort -O SAM -o $file1.sorted.sam $file1.sam
echo "Done sorting sam 1"
/usr/bin/time -v picard MarkDuplicates INPUT=$file1.sorted.sam OUTPUT=$file1.markdup.sam METRICS_FILE=$file1.metrics REMOVE_DUPLICATES=TRUE VALIDATION_STRINGENCY=LENIENT
echo "Finished MarkDuplicates on file 1"


/usr/bin/time -v samtools sort -O SAM -o $file2.sorted.sam $file2.sam
echo "Done sorting sam 2"
/usr/bin/time -v picard MarkDuplicates INPUT=$file2.sorted.sam OUTPUT=$file2.markdup.sam METRICS_FILE=$file2.metrics REMOVE_DUPLICATES=TRUE VALIDATION_STRINGENCY=LENIENT
echo "Finished MarkDuplicates on file 2"


exit