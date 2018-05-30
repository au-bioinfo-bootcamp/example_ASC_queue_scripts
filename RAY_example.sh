#!/bin/sh
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module purge
module load ray/2.3.1

#### COMMAND LINE FOR RAY GOES BELOW ####

srun --mpi=pmi2 Ray  \
-k 31  \
-p NAME_OF_LEFT_READS_FILE NAME_OF_RIGHT_READS_FILE  \
-o OUTPUT_DIRECTORY_NAME

####      submit job to class queue as "run_script_mpi this_script_name"         ####
#### request 10 CPU, 2:00:00 of run time, 20gb of memory and dmc as the cluster  ####
