#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --time=4:00:00
#SBATCH --mail-user=bcorwin@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=htseq-count
#SBATCH --output=logs/htseq-count_logs/htseq-count_%j.out
#SBATCH --error=logs/htseq-count_logs/htseq-count_%j.err

mkdir htseq-counts_CcoxCrh_comrhy59_EO_6cm_1/
mkdir htseq-counts_CcoxCrh_comrhy113_EO_adult_2/

conda activate QAA

sam1="/projects/bgmp/bcorwin/bioinfo/Bi623/PS/QAA/Alignments_CcoxCrh_comrhy59_EO_6cm_1.STAR_2.7.11b/CcoxCrh_comrhy59_EO_6cm_1.STAR_2.7.11b.Aligned.out.markdup.sam"
sam2="/projects/bgmp/bcorwin/bioinfo/Bi623/PS/QAA/Alignments_CcoxCrh_comrhy113_EO_adult_2.STAR_2.7.11b/CcoxCrh_comrhy113_EO_adult_2.STAR_2.7.11b.Aligned.out.markdup.sam"
gff="/projects/bgmp/shared/Bi623/PS2/campylomormyrus.gff"

out1_for="/projects/bgmp/bcorwin/bioinfo/Bi623/PS/QAA/htseq-counts_CcoxCrh_comrhy59_EO_6cm_1/CcoxCrh_comrhy59_EO_6cm_1_htseqcounts_forstranded.txt"
out1_rev="/projects/bgmp/bcorwin/bioinfo/Bi623/PS/QAA/htseq-counts_CcoxCrh_comrhy59_EO_6cm_1/CcoxCrh_comrhy59_EO_6cm_1_htseqcounts_revstranded.txt"

out2_for="/projects/bgmp/bcorwin/bioinfo/Bi623/PS/QAA/htseq-counts_CcoxCrh_comrhy113_EO_adult_2/CcoxCrh_comrhy113_EO_adult_2_htseqcounts_forstranded.txt"
out2_rev="/projects/bgmp/bcorwin/bioinfo/Bi623/PS/QAA/htseq-counts_CcoxCrh_comrhy113_EO_adult_2/CcoxCrh_comrhy113_EO_adult_2_htseqcounts_revstranded.txt"


/usr/bin/time -v htseq-count --stranded=yes -i ID  $sam1 $gff > $out1_for
/usr/bin/time -v htseq-count --stranded=reverse -i ID  $sam1 $gff > $out1_rev

/usr/bin/time -v htseq-count --stranded=yes -i ID  $sam2 $gff > $out2_for
/usr/bin/time -v htseq-count --stranded=reverse -i ID  $sam2 $gff > $out2_rev

exit