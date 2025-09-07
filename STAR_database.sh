#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --time=12:00:00
#SBATCH --mail-user=bcorwin@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=STAR_database
#SBATCH --output=logs/STAR_database_logs/STAR_database_%j.out
#SBATCH --error=logs/STAR_database_logs/STAR_database_%j.err

mamba activate QAA

/usr/bin/time -v STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir campylomormyrus.STAR_2.7.11b/ \
--genomeFastaFiles /projects/bgmp/shared/Bi623/PS2/campylomormyrus.fasta \
--genomeSAindexNbases 13 \
--sjdbGTFfile campylomormyrus.gtf

exit