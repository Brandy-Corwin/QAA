# Set Up (08/28/2025)

- Created conda environment called QAA that has:
    - FastQC v0.12.1
    - cutadapt 5.1
    - trimmomatic 0.40
    - SRA toolkit 3.2.1

### My files:  
SRR25630299  
SRR25630379

# PART 1  
## (09/03/2025)

- made create_fastqs.sh to prefetch and fasterq-dump my two sra files, then gzip the fastq files
    - prefetch: average time was ~2:00 and average cpu usage was 29%
    - fasterq-dump: average time was ~2:45 and average cpu usage was 99%
    - gzip: average time was ~24:00 for the first set and ~18:00 for the second and average cpu usage for all was 99%

- renamed files based on format: **Species_sample_tissue_age/size_sample#_readnumber.fastq.gz**
    - SRR25630299: CcoxCrh_comrhy59_EO_6cm_1_*readnumber*.fastq.gz
    - SRR25630379: CcoxCrh_comrhy113_EO_adult_2_*readnumber*.fastq.gz

- Ran ```/usr/bin/time -v fastqc -o fastqc/ *.fastq.gz``` on talaps using an srun
    - It ran all four fastq files in 14:40 and the cpu usage was 99%

- Added quality_dist.py from Demultiplex assignment and added argument for output name of histogram
