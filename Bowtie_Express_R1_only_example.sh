#!/bin/sh
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load bowtie
module load samtools
module load express
# place bowtie commands after this line
### MAP THE READ WITH BOWTIE AND USE SAMTOOLS TO CREATE A BAM FILE OF THE RESULTS ###
bowtie -p 4 -aS --offrate 1 BASENAME_OF_BOWTIE_INDEX \
NAME_OF_R1_FILE.fastq | \
samtools view -@ 4 -Sb - > R1_only_hits.bam

### SUBMIT THE FASTA AND BAM FILES TO EXPRESS FOR CALCULATING DE ACROSS THE TRANSCRIPTOME ###
express --output-dir express_using_R1_only NAME_OF_FASTA_FILE.fasta R1_only_hits.bam

### REMOVE THE BAM FILE SINCE IT IS NO LONGER NEEDED ####
rm -rf R1_only_hits.bam

#### submit job to class queue as "run_script this_script_name"         ####
#### and request 4 CPU, 2:00:00 of run time and 4gb of memory           ####
