#!/usr/bin/env python

import argparse
import gzip

# Define arguments that the user needs to input
def get_args():
    parser = argparse.ArgumentParser(description="This script generates a per base distribution of quality scores at each position for all reads.")
    parser.add_argument("-f1", "--file1", help="The path to the R1 input fastq file (str)", required=True, type=str)
    parser.add_argument("-f2", "--file2", help="The path to the R2 input fastq file (str)", required=True, type=str)
    parser.add_argument("-o", "--out", help="The path to the output tsv file (str)", required=True, type=str)
    return parser.parse_args()
	
args = get_args()

def length_count(line: str, counts: dict):
    length = len(line)
    if length in counts:
        counts[length] += 1
    elif length not in counts:
        counts[length] = 1


with gzip.open(args.file1, "r") as R1:
    R1_counts: dict = {}
    line_num:int = 0

    for line in R1:
        line = line.decode('utf-8').strip('\n')
        line_num += 1
        if line_num%4 == 2:
            length_count(line, R1_counts)

with gzip.open(args.file2, "r") as R2:
    R2_counts: dict = {}
    line_num:int = 0

    for line in R2:
        line = line.decode('utf-8').strip('\n')
        line_num += 1
        if line_num%4 == 2:
            length_count(line, R2_counts)

with open(args.out, "w") as out:
    out.write(f"Read\tLength\tCount\n")
    for len in R1_counts:
        out.write(f"R1\t{len}\t{R1_counts[len]}\n")
    for len in R2_counts:
        out.write(f"R2\t{len}\t{R2_counts[len]}\n")