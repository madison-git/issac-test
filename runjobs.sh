#!/bin bash

for n in {1..10};
do
    sbatch testjob.sh
done
squeue -u $USER

