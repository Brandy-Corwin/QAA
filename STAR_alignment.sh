#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --time=4:00:00
#SBATCH --mail-user=bcorwin@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=STAR_alignment
#SBATCH --output=logs/STAR_alignment_logs/STAR_alignment_%j.out
#SBATCH --error=logs/STAR_alignment_logs/STAR_alignment_%j.err

mamba activate QAA

s1r1="/projects/bgmp/bcorwin/bioinfo/Bi623/PS/QAA/trimmed/paired_CcoxCrh_comrhy59_EO_6cm_1_1.fastq.gz"
s1r2="/projects/bgmp/bcorwin/bioinfo/Bi623/PS/QAA/trimmed/paired_CcoxCrh_comrhy59_EO_6cm_1_2.fastq.gz"

s2r1="/projects/bgmp/bcorwin/bioinfo/Bi623/PS/QAA/trimmed/paired_CcoxCrh_comrhy113_EO_adult_2_1.fastq.gz"
s2r2="/projects/bgmp/bcorwin/bioinfo/Bi623/PS/QAA/trimmed/paired_CcoxCrh_comrhy113_EO_adult_2_2.fastq.gz"


/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $s1r1 $s1r2 \
--genomeDir campylomormyrus.STAR_2.7.11b/ \
--outFileNamePrefix Alignments_CcoxCrh_comrhy59_EO_6cm_1.STAR_2.7.11b/CcoxCrh_comrhy59_EO_6cm_1.STAR_2.7.11b.

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $s2r1 $s2r2 \
--genomeDir campylomormyrus.STAR_2.7.11b/ \
--outFileNamePrefix Alignments_CcoxCrh_comrhy113_EO_adult_2.STAR_2.7.11b/CcoxCrh_comrhy113_EO_adult_2.STAR_2.7.11b.

exit