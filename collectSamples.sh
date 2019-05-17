#!/bin/bash

# Locate all the R1 fastq files on the filesystem - just R1 could be enough...
for sample in JUQ{018..99}
do
	locate $sample | grep "R1.*fastq.gz"
done >> samplePaths.txt

# Format an input file for NGSCheckMate: path \t filename
awk -v OFS="\t" '{path=$1; sub(/.*\//, "", path); sub(/_L0.*/, "", path); print $1, path}' samplePaths.txt > sampleList_allLanes.txt

# Keep only one lane per sample, by removing lines with duplicated filenames
awk '!seen[$2]++' sampleList_allLanes.txt > sampleList.txt

# Clean up intermediate file
rm samplePaths.txt sampleList_allLanes.txt
