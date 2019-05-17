# GrandChallenge_QC

This repository describes the workflow to check the relatedness of the samples from the Grand Challenge project. It is based on NGSCheckMate from the Park Lab, a tool that checks sample relatedness based on the correlation of the allele fractions between samples.

## Installation

Installing NGSCheckMate is just a download, most easily done by cloning their repo.

```
cd <installation_dir>
git clone https://github.com/parklab/NGSCheckMate.git

## set NCM_HOME according to your shell environment
## for example, in bash, add the following to your .bashrc
export NCM_HOME=<installation_dir>/NGSCheckMate
```

