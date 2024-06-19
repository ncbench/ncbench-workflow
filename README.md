# NCBench continuous small variants benchmarking workflow.



[![Snakemake](https://img.shields.io/badge/snakemake-≥6.10.0-brightgreen.svg?style=flat)](https://snakemake.github.io) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8268264.svg)](https://doi.org/10.5281/zenodo.8268264)


A Snakemake workflow for benchmarking callsets of small genomic variants, using popular benchmark datasets like Genome in a Bottle or CHM-eval.
A detailed description of the workflow, also outlining all involved insights and design decisions can be found under https://doi.org/10.12688/f1000research.140344.1.

## Contributing callsets

1. Download raw data:
   | dataset                                                                            | link                                                                                                      |
   | ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
   | NA12878 Agilent (75M and 200M reads):                                              | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6513789.svg)](https://doi.org/10.5281/zenodo.6513789) |
   | NA12878 Twist (restricted access but you can ask for it via the zenodo interface): | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6907125.svg)](https://doi.org/10.5281/zenodo.6907125) |
   | CHM:                                                                               | [![URL](https://img.shields.io/badge/github-lh3%2FCHM--eval-orange)](https://github.com/lh3/CHM-eval)     |
2. Run your pipeline on it.
3. Upload results (VCF or BCF) to zenodo.
4. Create a **pull request** that adds your results to the [config file](https://github.com/koesterlab/benchmarking-ngscn-sig4/blob/main/config/config.yaml), under variant-calls. Thereby, comply to the following structure:
   ```yaml
   my-callset:
    labels:
      site: # name of your institute, group, department etc.
      pipeline: # name of the pipeline
      trimming: # tool used to trim reads
      read-mapping: # used read mapper
      base-quality-recalibration: # base recalibration method (remove if unused)
      realignment: # realignment method (remove if unused)
      variant-detection: # variant callers (provide comma-separated list if multiple ones are used)
      genotyping: # genotyper/event-typer used
      url: # URL of used pipeline
      # add any additional relevant attributes (they will appear in the false positive and false negative tables of the online report)
    subcategory: # category of callsets to include this one (see other entries in the config file and align with them if possible)
    zenodo:
      deposition: # zenodo record id (e.g. 7734975)
      filename: # name of vcf/bcf/vcf.gz file in the zenodo record
    benchmark: # benchmark to use (one of giab-NA12878-agilent-200M, giab-NA12878-agilent-75M, giab-NA12878-twist, and more, see https://github.com/snakemake-workflows/dna-seq-benchmark/blob/main/workflow/resources/presets.yaml)
    rename-contigs: resources/rename-contigs/ucsc-to-ensembl.txt # rename contigs from UCSC (prefixed with chr) to Ensembl style (remove if your contigs are already in Ensembl style)
   ```
5. The pull request will be automatically executed with the ncbench workflow and you will be able to download the resulting report with the assessment of your callset as an [artifact](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts) from the github actions CI interface.
6. Once the pull request has been reviewed and merged, your results will appear in the online report at https://ncbench.github.io.
7. If your callset receives an update, update your zenodo record and create a new pull request that updates the zenodo record ID in your config entry.

## Checking out results

The latest results for all contributed callsets are shown at https://ncbench.github.io.

## Running ncbench locally

For running ncbench locally, the following steps are required:

1. [Mamba](https://mamba.readthedocs.io) and [Install snakemake](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html).
2. Clone this git repository
3. Adapt the configuration according to your needs (e.g. add your own callset, and maybe remove all the other callsets if you are only interested in your own).
4. Run the workflow, first in dryrun mode with `snakemake -n --sdm conda` and then in reality with `snakemake --sdm conda --cores N` with `N` being your desired number of cores. You can also run it on cluster or cloud middleware. The Snakemake [documentation](https://snakemake.readthedocs.io/en/stable/executing/cli.html) provides all the details.
