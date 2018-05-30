#!/bin/sh
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
# place bowtie2 commands after this line
#	THIS IS A TWO STEP PROCESS
# 1)	BUILD AN INDEX FROM THE REFERENCE(S) TO MAP AGAINST
# 2)	MAP THE RAW SEQUENCE READS TO THE REFERENCE(S)

module load bowtie2

bowtie2-build REFERENCE_FILE_2_INDEX.fasta INDEX_BASENAME

bowtie2 -p 4 \
-x INDEX_BASENAME \
-1 NAME_OF_READ1.fastq \
-2 NAME_OF_READ2.fastq \
-S NAME_OF_OUTPUT_FILE.sam


#### submit job to class queue as "run_script this_script_name"  ####
#### and request 4 CPU, 2:00:00 of run time and 4gb of memory    ####
