#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --mem=16GB
#SBATCH --time=4:00:00
#SBATCH --mail-user=bcorwin@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=trim
#SBATCH --output=trim_logs/trim_%j.out
#SBATCH --error=trim_logs/trim_%j.err

conda activate QAA

/usr/bin/time -v trimmomatic PE -threads 8 trimmed/CcoxCrh_comrhy59_EO_6cm_1_1.fastq.gz trimmed/CcoxCrh_comrhy59_EO_6cm_1_2.fastq.gz trimmed/paired_CcoxCrh_comrhy59_EO_6cm_1_1.fastq.gz trimmed/unpaired_CcoxCrh_comrhy59_EO_6cm_1_1.fastq.gz trimmed/paired_CcoxCrh_comrhy59_EO_6cm_1_2.fastq.gz trimmed/unpaired_CcoxCrh_comrhy59_EO_6cm_1_2.fastq.gz HEADCROP:8 LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

/usr/bin/time -v trimmomatic PE -threads 8 trimmed/CcoxCrh_comrhy113_EO_adult_2_1.fastq.gz trimmed/CcoxCrh_comrhy113_EO_adult_2_2.fastq.gz trimmed/paired_CcoxCrh_comrhy113_EO_adult_2_1.fastq.gz trimmed/unpaired_CcoxCrh_comrhy113_EO_adult_2_1.fastq.gz trimmed/paired_CcoxCrh_comrhy113_EO_adult_2_2.fastq.gz trimmed/unpaired_CcoxCrh_comrhy113_EO_adult_2_2.fastq.gz HEADCROP:8 LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

exit