#!/bin/sh
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load bowtie
module load samtools
# place bowtie commands after this line
### MAP THE READ WITH BOWTIE AND USE SAMTOOLS TO CREATE A BAM FILE OF THE RESULTS ###
bowtie -p 4 -aS -X 800 --offrate 1 BASENAME_OF_BOWTIE_INDEX \
-1 NAME_OF_R1_FILE.fastq \
-2 NAME_OF_R2_FILE.fastq | \
samtools view -@ 4 -Sb - > R1_R2_hits.bam

### SUBMIT THE FASTA AND BAM FILES TO EXPRESS FOR CALCULATING DE ACROSS THE TRANSCRIPTOME ###
express --output-dir express_using_R1_R2 NAME_OF_FASTA_FILE.fasta R1_R2_hits.bam

### REMOVE THE BAM FILE SINCE IT IS NO LONGER NEEDED ####
rm -rf R1_R2_hits.bam

#### submit job to class queue as "run_script this_script_name"         ####
#### and request 4 CPU, 8:00:00 of run time and 4gb of memory           ####
