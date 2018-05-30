#!/bin/sh
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load ray/2.1.0
#### COMMAND LINE FOR RAY GOES BELOW ####
mpiexec Ray \
-k 31 \
-p NAME_OF_1ST_READ_SET NAME_OF_2ND_READ_SET \
-o ADD_OUTPUT_DIRECTORY_NAME

#### submit job to class queue as "run_script_mpi this_script_name"     ####
#### and request 10 CPU, 12:00:00 of run time and 20gb of memory        ####
