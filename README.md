# NCBench continuous small variants benchmarking workflow.



[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8268264.svg)](https://doi.org/10.5281/zenodo.8268264)


A Snakemake workflow for benchmarking callsets of small genomic variants, using popular benchmark datasets like Genome in a Bottle or CHM-eval.

## Contributing callsets

1. Download raw data:
   | dataset                                                                            | link                                                                                                      |
   | ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
   | NA12878 Agilent (75M and 200M reads):                                              | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6513789.svg)](https://doi.org/10.5281/zenodo.6513789) |
   | NA12878 Twist (restricted access but you can ask for it via the zenodo interface): | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6907125.svg)](https://doi.org/10.5281/zenodo.6907125) |
   | CHM:                                                                               | [![URL](https://img.shields.io/badge/github-lh3%2FCHM--eval-orange)](https://github.com/lh3/CHM-eval)     |
2. Run your pipeline on it.
3. Upload results (VCF or BCF) to zenodo.
4. Create a **pull request** that adds your results to the [config file](https://github.com/koesterlab/benchmarking-ngscn-sig4/blob/main/config/config.yaml), under variant-calls (see other entries for format).

## Checking out results

The latest results for all contributed callsets are shown at https://ncbench.github.io.
