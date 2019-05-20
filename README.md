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

```
python ncm_fastq.py -l sampleList.txt -O outdir -N outfile_prefix -p 4 -pt SNP.pt
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

Most important is the list of samples: a headerless txt file with the path to the full fastq(.gz) file seperated by a tab from a filename. For now, I just use R2 and only one lane per sample. The script collectSample.sh (included here) finds and formats an input file based on oart of the sample names; here the JUQ001-JUQ099 substring.
