#!/bin/sh
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module purge
module load ray/2.1.0


#If you are running on the UV, use the following


export MPI_MEMMAP_OFF=1
export SLURM_MPI_TYPE=pmi2


#### COMMAND LINE FOR RAY GOES BELOW ####
srun --mpi=pmi2 Ray \
-k 31 \
-p \
-o 

#### submit job to class queue as "run_script_mpi this_script_name"     ####
#### and request 10 CPU, 12:00:00 of run time and 20gb of memory        ####

