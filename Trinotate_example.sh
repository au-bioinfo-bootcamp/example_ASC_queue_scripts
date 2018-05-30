#!/bin/sh
export OMP_NUM_THREADS=10
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
#### NO NEED TO MODIFY THE COMMAND BELOW; BTW: WHAT DOES THE BELOW DO? ####
/home/shared/biobootcamp/bin/auto_Trinotate.sh

#### submit job to class queue as "run_script this_script_name"   ####
#### and request 10 CPU, 16:00:00 of run time and 20gb of memory  ####
