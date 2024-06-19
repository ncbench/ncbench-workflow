# NCBench continuous small variants benchmarking workflow.



[![Snakemake](https://img.shields.io/badge/snakemake-≥6.10.0-brightgreen.svg?style=flat)](https://snakemake.github.io) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8268264.svg)](https://doi.org/10.5281/zenodo.8268264)


A Snakemake workflow for benchmarking callsets of small genomic variants, using popular benchmark datasets like Genome in a Bottle or CHM-eval.

## Contributing callsets

1. Download raw data:
- Germline:
   | dataset                                                                            | link                                                                                                      |
   | ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
   | NA12878 Agilent (75M and 200M reads):                                              | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6513789.svg)](https://doi.org/10.5281/zenodo.6513789) |
   | NA12878 Twist (restricted access but you can ask for it via the zenodo interface): | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6907125.svg)](https://doi.org/10.5281/zenodo.6907125) |
   | CHM:                                                                               | [![URL](https://img.shields.io/badge/github-lh3%2FCHM--eval-orange)](https://github.com/lh3/CHM-eval)     |

- Somatic:

   | dataset    | link tumor bam                                                                                                                                                                           | SRA ID tumor FASTQ | link normal bam                                                                                                                                                                          | SRA ID normal fastq |
   |------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------|
   | SEQC2 WES  | [![URL](https://img.shields.io/badge/github-lh3%2FCHM--eval-orange)](https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/seqc/Somatic_Mutation_WG/data/WES/WES_EA_T_1.bwa.dedup.bam)     | SRR7890918         | [![URL](https://img.shields.io/badge/github-lh3%2FCHM--eval-orange)](https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/seqc/Somatic_Mutation_WG/data/WES/WES_EA_N_1.bwa.dedup.bam)     | SRR7890919          |
   | SEQC2 WGS  | [![URL](https://img.shields.io/badge/github-lh3%2FCHM--eval-orange)](https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/seqc/Somatic_Mutation_WG/data/WGS/WGS_NS_T_1.bwa.dedup.bam)     | SRR7890893         | [![URL](https://img.shields.io/badge/github-lh3%2FCHM--eval-orange)](https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/seqc/Somatic_Mutation_WG/data/WGS/WGS_NS_N_1.bwa.dedup.bam)     | SRR7890943          |
   | SEQC2 FFPE | [![URL](https://img.shields.io/badge/github-lh3%2FCHM--eval-orange)](https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/seqc/Somatic_Mutation_WG/data/FFX/FFX_IL_T_24h_1.bwa.dedup.bam) | SRR7890933         | [![URL](https://img.shields.io/badge/github-lh3%2FCHM--eval-orange)](https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/seqc/Somatic_Mutation_WG/data/FFX/FFX_IL_N_24h_2.bwa.dedup.bam) | SRR7890951          |
2. Run your pipeline on it.
3. Upload results (VCF or BCF) to zenodo.
4. Create a **pull request** that adds your results to the [config file](https://github.com/koesterlab/benchmarking-ngscn-sig4/blob/main/config/config.yaml), under variant-calls (see other entries for format).

## Checking out results

The latest results for all contributed callsets are shown at https://ncbench.github.io.
