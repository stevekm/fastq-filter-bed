# fastq-filter-bed

A set of scripts to filter .fastq.gz files based on regions in a .bed file


## Requirements:

- source .fastq.gz files

- .bam & .bam.bai files of alignments for each set of source .fastq.gz files

- .bed formatted file with genomic regions to filter for (`targets.bed`; example file included)

These scripts will search the provided .bam file for all alignments that fall within the specified genomic regions, then extract the original sequences for those alignments from the .fastq.gz files. 

- example input, output, and system logs included for illustration 

## Output

A file in the included `output_fastq` directory with only the filtered reads for each input .fastq.gz file.

# Usage

Two sets of scripts are included

## `filter.py`

A script that will filter a single sample's set of reads. Script arguments:

- a comma-separated character string of paths to input .fastq.gz files

- a path to a .bam file to search for matching alignments (.bai must also be present)

Example usage:

```bash
fastq_list="input_fastq/HapMap-B17-1267_S8_L002_R2_001.fastq.gz,input_fastq/HapMap-B17-1267_S8_L003_R1_001.fastq.gz,input_fastq/HapMap-B17-1267_S8_L002_R1_001.fastq.gz,input_fastq/HapMap-B17-1267_S8_L001_R1_001.fastq.gz,input_fastq/HapMap-B17-1267_S8_L001_R2_001.fastq.gz,input_fastq/HapMap-B17-1267_S8_L004_R2_001.fastq.gz,input_fastq/HapMap-B17-1267_S8_L004_R1_001.fastq.gz,input_fastq/HapMap-B17-1267_S8_L003_R2_001.fastq.gz"

./run_script.py "$fastq_list" input_bam/HapMap-B17-1267.bam
```

### `submit-filter.sh`

This script parses the file `sample_files.tsv` (example included) to submit each sample as a separate job on the HPC cluster (SGE).

## `filter-sheet.py`

Does the same thing as `filter.py`, but parses the `sample_files.tsv` itself and filters all files sequentially. 
Example usage:

```bash
python filter-sheet.py
```

### `submit-filter-sheet.sh`

Submits the `filter-sheet.py` script to run on the compute cluster.

