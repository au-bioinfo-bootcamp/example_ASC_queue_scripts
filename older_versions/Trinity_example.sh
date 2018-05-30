#!/bin/sh
export OMP_NUM_THREADS=10
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load trinity/2014-04-13p1

#### SET UP FOR RUNNING TRINITY ON SCRATCH-LOCAL IS BELOW ####

# $$ convention generates a unique number for your job
# This is important so that two jobs running on the same node aren't
# using the same directory
orig_directory=`pwd`
job_directory="/scratch-local/trinity$$"
mkdir $job_directory
cp -r * $job_directory
cd $job_directory
echo "job directory is $job_directory"

#### THIS IS THE ACTUAL TRINITY COMMAND AND ITS OPTIONS ####
#### CHANGE fq TO fa IF READS ARE IN FASTA FORMAT ####
#### YOU WILL NEED TO CHANGE NAME_OF_1ST_READ_SET AND NAME_OF_2ND_READ_SET TO THEIR APPROPRIATE FILENAMES ####
#### TRINITY SPECIFIC OPTIONS ARE IN THE 4TH LINE BELOW; LEAVE AS-IS FOR PURPOSES OF THE BOOTCAMP ####

Trinity --seqType fq \
--left NAME_OF_1ST_READ_SET \
--right NAME_OF_2ND_READ_SET \
--CPU 6 --JM 20G --full_cleanup --bflyGCThreads 3 --bflyHeapSpaceMax 20G

#### BELOW PACKAGES UP THE OUTPUT AND MOVES IT TO $HOME FROM SCRATCH-LOCAL THEN CLEANS UP ####

# put the results in a tar file
tar -czvf trinity$$.tgz *

# copy results back to your home directory
cp trinity$$.tgz $orig_directory

# remove the job directory
cd $orig_directory
rm -r $job_directory

#### submit job to class queue as "run_script this_script_name"  ####
#### and request 10 CPU, 16:00:00 of run time and 40gb of memory ####
