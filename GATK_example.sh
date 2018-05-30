#!/bin/sh

#load modules needed for this job
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module purge
module load gatk


#### COMMAND LINE FOR GATK BELOW ####

java -Xms2g -Xmx4g -jar /opt/asn/apps/gatk_3.4-46/GenomeAnalysisTK.jar -R Lamellibrachia_luymesi_2000bp_plus.fasta -T HaplotypeCaller -I Lamellibrachia_luymesi_transcriptomic_variants.sorted.wHeader.bam -o Lamellibrachia_luymesi_transcriptomic_variants.vcf


#### submit job to class queue as "run_script this_script_name"     ####
#### and request 1 CPU, 0:30:00 of run time and 3gb of memory       ####