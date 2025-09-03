#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --mem=16GB
#SBATCH --time=8:00:00
#SBATCH --mail-user=bcorwin@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=create_fastqs
#SBATCH --output=create_fastqs_logs/create_fastqs_%j.out
#SBATCH --error=create_fastqs_logs/create_fastqs_%j.err

conda activate QAA


/usr/bin/time -v prefetch SRR25630299
/usr/bin/time -v fasterq-dump SRR25630299
/usr/bin/time -v gzip SRR25630299_1.fastq
/usr/bin/time -v gzip SRR25630299_2.fastq

/usr/bin/time -v prefetch SRR25630379
/usr/bin/time -v fasterq-dump SRR25630379
/usr/bin/time -v gzip SRR25630379_1.fastq
/usr/bin/time -v gzip SRR25630379_2.fastq

exit