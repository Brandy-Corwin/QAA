#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --mem=16GB
#SBATCH --time=4:00:00
#SBATCH --mail-user=bcorwin@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=make_hists
#SBATCH --output=make_hists_logs/make_hists_%j.out
#SBATCH --error=make_hists_logs/make_hists_%j.err

file1="CcoxCrh_comrhy59_EO_6cm_1_1"
file2="CcoxCrh_comrhy59_EO_6cm_1_2"
file3="CcoxCrh_comrhy113_EO_adult_2_1"
file4="CcoxCrh_comrhy113_EO_adult_2_2"

conda activate QAA 

/usr/bin/time -v ./quality_dist.py -f $file1.fastq.gz -l 150 -o histograms/$file1.png
/usr/bin/time -v ./quality_dist.py -f $file2.fastq.gz -l 150 -o histograms/$file2.png
/usr/bin/time -v ./quality_dist.py -f $file3.fastq.gz -l 150 -o histograms/$file3.png
/usr/bin/time -v ./quality_dist.py -f $file4.fastq.gz -l 150 -o histograms/$file4.png

exit