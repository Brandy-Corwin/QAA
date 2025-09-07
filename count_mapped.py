#!/usr/bin/env python

with open("Alignments_Danio_rerio.GRCz11.dna.ens114.STAR_2.7.11b/Danio_rerio.GRCz11.dna.ens114.STAR_2.7.11b.Aligned.out.sam", "r") as sam:
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