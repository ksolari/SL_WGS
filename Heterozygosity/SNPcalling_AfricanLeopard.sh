#!/bin/bash
#SBATCH --job-name=GATK-AfL_1
#SBATCH --time=2-00:00:00
#SBATCH --mem=240000
#SBATCH --partition=dpetrov,normal
#SBATCH -n 36
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=ksolari@stanford.edu
module load biology bwa
module load biology samtools
module load biology gatk
module load biology bcftools
REFERENCE=../AsianLeopard/GCA_024362965.1_ASM2436296v1_genomic.fna
#THREADS_BWA=46
#bwa index -a bwtsw $REFERENCE
#samtools faidx $REFERENCE
#java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar CreateSequenceDictionary R=$REFERENCE
for file in ERR5671299*.1.bam;do
   bn=${file%??????}
   echo "Processing $bn"
   #bwa mem -t $THREADS_BWA $REFERENCE ${bn}_1.fastq.gz ${bn}_2.fastq.gz | samtools view -bS - | samtools sort - > ${bn}.sorted.bam
   #samtools index ${bn}_sorted.bam
   #java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar AddOrReplaceReadGroups I=${bn}_AsLeop_map2leop_sorted.bam O=${bn}_sorted.rg.bam SORT_ORDER=coordinate RGID=${bn} RGLB=${bn} RGPL=illumina RGSM=${bn} RGPU=${$
   #java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar MarkDuplicates I=${bn}_sorted.rg.bam O=${bn}_sorted.rg.md.bam M=${bn}.metrics.md.txt
   samtools index ${bn}.1.bam
   gatk HaplotypeCaller -I ${bn}.1.bam -O ${bn}.haplotypecaller.g.vcf -ERC GVCF -R $REFERENCE
done

samtools view -b -s 0.6 ERR5671308_sorted.rg.md.bam > ERR5671308_sorted_rg_downsampled60.bam
samtools view -b -s 0.5 ERR5671314_sorted.rg.md.bam > ERR5671314_sorted_rg_downsampled50.bam
bamtools split -in ERR5671299_sorted.rg.md.bam -reference 
bamtools split -in ERR5671307_sorted.rg.md.bam -reference
bamtools split -in ERR5671308_sorted_rg_downsampled60.bam -reference
bamtools split -in ERR5671314_sorted_rg_downsampled50.bam -reference
bamtools split -in ERR5671315_sorted.rg.md.bam -reference

module load biology bcftools
grep “#” ERR5671299_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf > ERR5671299_header.txt
grep “#” ERR5671307_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf > ERR5671307_header.txt
grep “#” ERR5671308_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf > ERR5671308_header.txt
grep “#” ERR5671314_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf > ERR5671314_header.txt
grep “#” ERR5671315_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf > ERR5671315_header.txt

sort ERR5671299_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf | uniq > ERR5671299_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf
sort ERR5671307_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf | uniq > ERR5671307_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf
sort ERR5671308_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf | uniq > ERR5671308_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf
sort ERR5671314_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf | uniq > ERR5671314_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf
sort ERR5671315_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf | uniq > ERR5671315_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf

grep -v '^#' ERR5671299_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf > ERR5671299_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf
grep -v '^#' ERR5671307_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf > ERR5671307_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf
grep -v '^#' ERR5671308_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf > ERR5671308_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf
grep -v '^#' ERR5671314_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf > ERR5671314_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf
grep -v '^#' ERR5671315_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf > ERR5671315_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf

cat ERR5671299_header.txt ERR5671299_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf > ERR5671299_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
cat ERR5671307_header.txt ERR5671307_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf > ERR5671307_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
cat ERR5671308_header.txt ERR5671308_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf > ERR5671308_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
cat ERR5671314_header.txt ERR5671314_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf > ERR5671314_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
cat ERR5671315_header.txt ERR5671315_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf > ERR5671315_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf

bcftools sort -O v -o ERR5671299_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf ERR5671299_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
bcftools sort -O v -o ERR5671307_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf ERR5671307_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
bcftools sort -O v -o ERR5671308_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf ERR5671308_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
bcftools sort -O v -o ERR5671314_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf ERR5671314_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
bcftools sort -O v -o ERR5671315_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf ERR5671315_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf

####have to run each contig at a time - use script below to make script to do this:
import os
import sys
import fileinput

for line in fileinput.input():
l = line[:-1]
print ("gatk CombineGVCFs -R $REFERENCE --variant ERR5671315_gvcf/ERR5671315_sorted.rg.md.REF_" + l + ".haplotypecaller.g.vcf --variant ERR5671307_gvcf/ERR5671307_sorted.rg.md.REF_" + l + ".haplotypecaller.g.vcf --variant ERR5671314_gvcf/ERR5671314_sorted_rg_downsampled50.REF_" + l + ".haplotypecaller.g.vcf --variant ERR5671299_gvcf/ERR5671299_sorted.rg.md.REF_" + l + ".haplotypecaller.g.vcf --variant ERR5671308_gvcf/ERR5671308_sorted_rg_downsampled60.REF_" + l + ".haplotypecaller.g.vcf -O AfricanLeop_n5_" + l + ".g.vcf.gz")
print ("gatk --java-options \"-Xmx4g\" GenotypeGVCFs -R $REFERENCE -V AfricanLeop_n5_" + l + ".g.vcf.gz -O AfricanLeop_n5_" + l + ".vcf.gz")
