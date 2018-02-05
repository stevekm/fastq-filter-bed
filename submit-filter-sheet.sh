#!/bin/bash

# run the filter-sheet.py script on the HPC cluster

script="filter-sheet.py"

job_name="filter_fastq"

qsub_logdir="logs"
mkdir -p "$qsub_logdir"

qsub -wd $PWD -o :${qsub_logdir}/ -e :${qsub_logdir}/ -j y -N "$job_name" <<E0F
date +"%Y-%m-%d-%H-%M-%S"
start=\$(date +%s)

module unload python
module load python/2.7

set -x

python -u "$script"

date +"%Y-%m-%d-%H-%M-%S"
echo "Duration: \$(((\$(date +%s)-\$start)/60)) minutes"
set +x
E0F
