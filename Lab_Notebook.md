# Set Up (08/28/2025)

- Created conda environment called QAA that has:
    - FastQC v0.12.1
    - cutadapt 5.1
    - trimmomatic 0.40
    - SRA toolkit 3.2.1
    - Star 2.7.11b
    - Picard 2.18.29
    - Samtools 1.22.1
    - NumPy 1.26.4
    - Matplotlib 3.10.6
    - HTSeq 2.0.5
    - gffread 0.12.7 

- Made QAA_report.Rmd to create pdf report

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
- Made make_hists.sh to run quality_dist.py on all four files
    - All four files took about 45 minutes to run and used 99% cpu


# Part 2  
## (09/04/2025)

#### Cutadapt
using srun, ran

```/usr/bin/time -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o trimmed/CcoxCrh_comrhy59_EO_6cm_1_1.fastq.gz -p trimmed/CcoxCrh_comrhy59_EO_6cm_1_2.fastq.gz CcoxCrh_comrhy59_EO_6cm_1_1.fastq.gz CcoxCrh_comrhy59_EO_6cm_1_2.fastq.gz``` (7 min, 99% cpu) (R1 = 6.4%, R2 = 7.2% were trimmed)

and

```/usr/bin/time -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o trimmed/CcoxCrh_comrhy113_EO_adult_2_1.fastq.gz -p trimmed/CcoxCrh_comrhy113_EO_adult_2_2.fastq.gz CcoxCrh_comrhy113_EO_adult_2_1.fastq.gz CcoxCrh_comrhy113_EO_adult_2_2.fastq.gz``` (5:30 min, 99% cpu) (R1 = 11.1%, R2 = 11.7% were trimmed)

#### Trimmomatic

- Using sbatch (trim.sh), ran trimmomatic on my cutadapt trimmed files
    - CcoxCrh_comrhy59_EO_6cm_1: 10:48 min and 513% cpu
    - CcoxCrh_comrhy113_EO_adult_2: 7:54 min and 522% cpu

#### length distribution

- made len_dist.py to create a tsv file with the read number, length, and count of length
    - ran in sbatch script len_dist.sh
        - CcoxCrh_comrhy59_EO_6cm_1: 4:24 min and 99% cpu
        - CcoxCrh_comrhy113_EO_adult_2: 3:21 min and 99% cpu
- then used R (len_dist_histogram.R) to graph the distribution

- I have a lot of log files, so I put all of them into a logs directory


# Part 3  
## (09/06/2025)

- Used command ```gffread -E /projects/bgmp/shared/Bi623/PS2/campylomormyrus.gff -o campylomormyrus.gtf``` to convert gff to gtf
- made STAR_database.sh to create star database and STAR_alignment.sh to run the star alinment on each set of files
- ran STAR_database.sh
    - command took 4:10 minutes and used 485% cpu
- ran STAR_alignment.sh
    - CcoxCrh_comrhy59_EO_6cm_1: 14:36 min and 770% cpu
    - CcoxCrh_comrhy113_EO_adult_2: 11:30 min and 771% cpu
- made sort_and_mark.sh to sort the sam file, then run MarkDuplicates

| File | sort | MarkDuplicates |
|------|------|----------------|
| CcoxCrh_comrhy59_EO_6cm_1 | 5:07 min, 98% cpu | 13:08 min, 120% cpu |
| CcoxCrh_comrhy113_EO_adult_2 | 2:44 min, 98% cpu | 9:54 min, 122% cpu |

## (09/07/2025)

- ran count_mapped.py on deduplicated files
    - ```/usr/bin/time -v ./count_mapped.py -f Alignments_CcoxCrh_comrhy59_EO_6cm_1.STAR_2.7.11b/CcoxCrh_comrhy59_EO_6cm_1.STAR_2.7.11b.Aligned.out.markdup.sam > Alignments_CcoxCrh_comrhy59_EO_6cm_1.STAR_2.7.11b/CcoxCrh_comrhy59_EO_6cm_1_count_mapped.txt```
        - 50 sec and 98% cpu; mapped: 29749319; unmapped: 9402878
    - ```/usr/bin/time -v ./count_mapped.py -f Alignments_CcoxCrh_comrhy113_EO_adult_2.STAR_2.7.11b/CcoxCrh_comrhy113_EO_adult_2.STAR_2.7.11b.Aligned.out.markdup.sam > Alignments_CcoxCrh_comrhy113_EO_adult_2.STAR_2.7.11b/CcoxCrh_comrhy113_EO_adult_2_count_mapped.txt```
        - 44 sec and 99% cpu; mapped: 25900086; unmapped: 10680808

- made htseq-count.sh to run both runs of htsqe-count on my files
    - forward CcoxCrh_comrhy59_EO_6cm_1: 21:05 min and 99% cpu
    - reverse CcoxCrh_comrhy59_EO_6cm_1: 21:53 min and 99% cpu
    - forward CcoxCrh_comrhy113_EO_adult_2: 18:42 min and 99% cpu
    - reverse CcoxCrh_comrhy113_EO_adult_2: 19:11 min and 99% cpu

- made test_strandedness.R to make a scatter plot of the reverse vs forward read counts to determine strandedness.