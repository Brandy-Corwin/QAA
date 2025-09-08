#!/usr/bin/env python

import argparse

# Define arguments that the user needs to input
def get_args():
    parser = argparse.ArgumentParser(description="This script generates a per base distribution of quality scores at each position for all reads.")
    parser.add_argument("-f", "--file", help="The path to the input file (str)", required=True, type=str)
    return parser.parse_args()
	
args = get_args()

with open(args.file, "r") as sam:
    mapped: int = 0
    unmapped: int = 0
    for line in sam:
        line = line.strip('\n')

        if line.startswith("@"):
            continue

        flag = int(line.split("\t")[1])
        
        if ((flag & 256) != 256):
            if ((flag & 4) != 4):
                mapped += 1
            else:
                unmapped += 1
    print(f"reads mapped: {mapped}\nreads unmapped: {unmapped}")