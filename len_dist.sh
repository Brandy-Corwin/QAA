#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --mem=16GB
#SBATCH --time=2:00:00
#SBATCH --mail-user=bcorwin@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=len_dist
#SBATCH --output=len_dist_logs/len_dist_%j.out
#SBATCH --error=len_dist_logs/len_dist_%j.err

conda activate QAA

mkdir length_distributions

/usr/bin/time -v ./len_dist.py -f1 trimmed/paired_CcoxCrh_comrhy59_EO_6cm_1_1.fastq.gz -f2 trimmed/paired_CcoxCrh_comrhy59_EO_6cm_1_2.fastq.gz -o length_distributions/CcoxCrh_comrhy59_EO_6cm_1.tsv

/usr/bin/time -v ./len_dist.py -f1 trimmed/paired_CcoxCrh_comrhy113_EO_adult_2_1.fastq.gz -f2 trimmed/paired_CcoxCrh_comrhy113_EO_adult_2_2.fastq.gz -o length_distributions/CcoxCrh_comrhy113_EO_adult_2.tsv

exit