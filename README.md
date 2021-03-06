# GrandChallenge_QC

This repository describes the workflow to check the relatedness of the samples from the Grand Challenge project. It is based on NGSCheckMate from the Park Lab, a tool that checks sample relatedness based on the correlation of the allele fractions between samples. It was developed for human WGS and bulk RNAseq data, but seems to work for single cell techniques as well. 

## Installation

Installing NGSCheckMate is just a download, most easily done by cloning their repo.

```
cd <installation_dir>
git clone https://github.com/parklab/NGSCheckMate.git

## set NCM_HOME according to your shell environment
## for example, in bash, add the following to your .bashrc
export NCM_HOME=<installation_dir>/NGSCheckMate
```

## Example

Run from the NGSCheckMate folder:

```
python ncm_fastq.py -l sampleList.txt -O outdir -N outfile_prefix -p 4 -pt SNP/SNP.pt
```

### Arguments

```
-l	list of samples (one per line: path_to_fastq.gz tab filename)
-O	output directory
-N	prefix for output files
-p	number of processors
-pt	list of known SNPs (included in SNP folder in NGSCheckMate package)
```

### Input

Most important is the list of samples: a headerless txt file with the path to the full fastq(.gz) file seperated by a tab from a filename. For now, I just use R2 and only one lane per sample, this might be adapted for the different sample types. The script collectSample.sh (included here) finds and formats an input file based on part of the sample names; here the JUQ001-JUQ099 substring.

### Output

Three txt files describing (1) correlation coefficients between all samples, (2) all sample combinations above a certain threshold ("matching" samples) and (3) a correlation matrix. 
Most useful is probably the pdf showing a dendrogram of all samples. So far, the way samples are being clustered together is the easiest way to assess relatedness.

## Notes

It might be usefiule to run fastqc on all fastq files used in the analysis to detect reasons for not matching.

```
awk '{print $1}' sampleList.txt | xargs -n1 fastqc -o /path/to/outdir/
```

More reads improve the analysis, so it might be a good idea to merge lanes before if results look strange.
