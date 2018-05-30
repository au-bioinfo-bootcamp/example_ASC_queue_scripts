#!/bin/sh
export OMP_NUM_THREADS=10
source /opt/asn/etc/asn-bash-profiles-special/modules.sh

module load trinity/2.2.0

Trinity --seqType fq \
--left NAME_OF_LEFT_READS_FILE  \
--right NAME_OF_RIGHT_READS_FILE \
--CPU 6  --max_memory 20G  --full_cleanup --bflyGCThreads 3 --bflyHeapSpaceMax 20G

####  submit job to class queue as "run_script this_script_name"  ####
####  and request 6 CPU, 2:00:00 of walltime and 20gb of memory  ####
