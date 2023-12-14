#!/bin/bash
#SBATCH --job-name=GATK-puma
#SBATCH --time=6-00:00:00
#SBATCH --mem=240000
#SBATCH --partition=dpetrov
#SBATCH -n 36
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=ksolari@stanford.edu
module load biology bwa
module load biology samtools
module load biology gatk
module load biology bcftools
REFERENCE=GCF_003327715.1_PumCon1.0_genomic.fna
#THREADS_BWA=46
#bwa index -a bwtsw $REFERENCE
#samtools faidx $REFERENCE
#java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar CreateSequenceDictionary R=$REFERENCE
for file in *_1.fastq;do
   bn=${file%????????}
   echo "Processing $bn"
   #bwa mem -t $THREADS_BWA $REFERENCE ${bn}_1.fastq.gz ${bn}_2.fastq.gz | samtools view -bS - | samtools sort - > ${bn}.sorted.bam
   #samtools index ${bn}_sorted.bam
   #java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar AddOrReplaceReadGroups I=${bn}_sorted.bam O=${bn}_sorted.rg.bam SORT_ORDER=coordinate RGID=${bn} RGLB=${bn} RGPL=illumina RGSM=${bn} RGPU=${bn} CREATE_INDEX=True
   #java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar MarkDuplicates I=${bn}_sorted.rg.bam O=${bn}_sorted.rg.md.bam M=${bn}.metrics.md.txt
   #samtools index ${bn}_sorted.rg.md.bam
   gatk HaplotypeCaller -I ${bn}_sorted.rg.md.bam -O ${bn}.rg.md.haplotypecaller.g.vcf -ERC GVCF -R $REFERENCE
done

#run this after everything completes in above steps
gatk CombineGVCFs -R $REFERENCE --variant BR406_all.rg.md.haplotypecaller.g.vcf --variant EVG21_all.rg.md.haplotypecaller.g.vcf --variant SMM22_all.rg.md.haplotypecaller.g.vcf --variant CYP47_all.rg.md.haplotypecaller.g.vcf --variant SC29_all.rg.md.haplotypecaller.g.vcf --variant YNP198_all.rg.md.haplotypecaller.g.vcf -O Puma_n6.g.vcf.gz
gatk --java-options "-Xmx4g" GenotypeGVCFs -R $REFERENCE -V Puma_n6.g.vcf.gz -O Puma_n6.vcf.gz
 
  
