#!/bin/bash

#SBATCH -J mbio  	       ## User defined name of job
#SBATCH -A ACF-UTK0011	       ## Project account to be charged
#SBATCH --nodes=1              ## Number of nodes
#SBATCH --ntasks-per-node=1    ## Number of tasks per compute node
#SBATCH --time=00:00:30        ## hours:minutes:seconds
#SBATCH --partition=short      ## At present, we have four partitions.
                               ## Use sinfo to check partitions

#SBATCH -o log/job_%j            ## send stderr stdout to the spcified file
#SBATCH --qos=short

###########   Perform some simple commands   ########################
#set -x        ## Make shell print all subsequent commands to screen

# Create a log directory if one doesn't exist.
mkdir -p log

###########   What is the hostname   ###############
echo "HOSTNAME: `hostname`"

echo "STARTING JOB"

# Load all modules included in anaconda3. May need to load other modules.
module load anaconda3/2023.09

export PYTHONPATH=$HOME/.local/lib/python3.11/site-packages:$PYTHONPATH

echo "Running TestJob.ipynb"
echo ""

jupyter nbconvert --to notebook --execute TestJob.ipynb

echo "ENDING JOB"




