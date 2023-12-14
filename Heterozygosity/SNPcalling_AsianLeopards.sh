#!/bin/bash
#SBATCH --job-name=GATK-AsLeop
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
REFERENCE=GCA_024362965.1_ASM2436296v1_genomic.fna
#THREADS_BWA=46
#bwa index -a bwtsw $REFERENCE
#samtools faidx $REFERENCE
java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar CreateSequenceDictionary R=$REFERENCE
for file in *_AsLeop_map2leop_sorted.bam;do
   bn=${file%???????????????????????????}
   echo "Processing $bn"
   #bwa mem -t $THREADS_BWA $REFERENCE ${bn}_1.fastq.gz ${bn}_2.fastq.gz | samtools view -bS - | samtools sort - > ${bn}.sorted.bam
   samtools index ${bn}_sorted.bam
   java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar AddOrReplaceReadGroups I=${bn}_sorted.bam O=${bn}_sorted.rg.bam SORT_ORDER=coordinate RGID=${bn} RGLB=${bn} RGPL=illumina RGSM=${bn} RGPU=${bn} CREATE_INDEX=True
   java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar MarkDuplicates I=${bn}_sorted.rg.bam O=${bn}_sorted.rg.md.bam M=${bn}.metrics.md.txt
   samtools index ${bn}_sorted.rg.md.bam
   gatk HaplotypeCaller -I ${bn}_sorted.rg.md.bam -O ${bn}.rg.md.haplotypecaller.g.vcf -ERC GVCF -R $REFERENCE
done

samtools view -b -s 0.6 ERR5671311_sorted.rg.md.bam > ERR5671311_sorted_rg_downsampled60.bam
samtools view -b -s 0.5 ERR5671313_sorted.rg.md.bam > ERR5671313_sorted_rg_downsampled50.bam

bamtools split -in ERR5671298_sorted.rg.md.bam -reference
bamtools split -in ERR5671303_sorted.rg.md.bam  -reference
bamtools split -in ERR5671311_sorted_rg_downsampled60.bam -reference
bamtools split -in ERR5671313_sorted_rg_downsampled50.bam -reference
bamtools split -in ERR5671323_sorted.rg.md.bam -reference

##Put all .g.vcf files for one sample into new folder
##grep “#” one.g.vcf > header.txt
cat *vcf >ERR5671299_sorted_rg_md_haplotypecaller_CAT.g.vcf
grep -v '^#' ERR5671313_sorted_rg_downsampled50_CAT.g.vcf > ERR5671313_sorted_rg_downsampled50_CAT_no_header.g.vcf
cat header.txt ERR5671313_sorted_rg_downsampled50_CAT_no_header.g.vcf > ERR5671313_sorted_rg_downsampled50_CAT_wONEheader.g.vcf

bcftools sort -O v -o ERR5671303_sorted_rg_md_haplotypecaller_CAT_ONEheader_sorted.g.vcf ERR5671303_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf
bcftools sort -O v -o ERR5671311_sorted_rg_md_haplotypecaller_CAT_ONEheader_sorted.g.vcf ERR5671311_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf
bcftools sort -O v -o ERR5671313_sorted_rg_md_haplotypecaller_CAT_ONEheader_sorted.g.vcf ERR5671313_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf
bcftools sort -O v -o ERR5671323_sorted_rg_md_haplotypecaller_CAT_ONEheader_sorted.g.vcf ERR5671323_sorted_rg_md_haplotypecaller_CAT_ONEheader.g.vcf


sort ERR5671303_sorted_rg_md_haplotypecaller_CAT_ONEheader_sorted.g.vcf | uniq > ERR5671303_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf
sort ERR5671311_sorted_rg_md_haplotypecaller_CAT_ONEheader_sorted.g.vcf | uniq > ERR5671311_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf
sort ERR5671313_sorted_rg_md_haplotypecaller_CAT_ONEheader_sorted.g.vcf | uniq > ERR5671313_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf
sort ERR5671323_sorted_rg_md_haplotypecaller_CAT_ONEheader_sorted.g.vcf | uniq > ERR5671323_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf

grep -v '^#' ERR5671303_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf > ERR5671303_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf
grep -v '^#' ERR5671311_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf > ERR5671311_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf
grep -v '^#' ERR5671313_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf > ERR5671313_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf
grep -v '^#' ERR5671323_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq.g.vcf > ERR5671323_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf

cat ERR5671303_header.txt ERR5671303_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf > ERR5671303_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
cat ERR5671311_header.txt ERR5671311_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf > ERR5671311_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
cat ERR5671313_header.txt ERR5671313_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf > ERR5671313_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
cat ERR5671323_header.txt ERR5671323_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_noheader.g.vcf > ERR5671323_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf

bcftools sort -O v -o ERR5671303_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf ERR5671303_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
bcftools sort -O v -o ERR5671311_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf ERR5671311_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
bcftools sort -O v -o ERR5671313_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf ERR5671313_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf
bcftools sort -O v -o ERR5671323_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf ERR5671323_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader.g.vcf

gatk CombineGVCFs -R $REFERENCE --variant AsianLeopFinalConcatGVCF/ERR5671303_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf --variant AsianLeopFinalConcatGVCF/ERR5671311_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf --variant AsianLeopFinalConcatGVCF/ERR5671313_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf --variant AsianLeopFinalConcatGVCF/ERR5671323_sorted_rg_md_haplotypecaller_CAT_ONEheader_uniq_oneHeader_sorted.g.vcf -O AsianLeop_n4.g.vcf.gz
gatk --java-options "-Xmx4g" GenotypeGVCFs -R $REFERENCE -V AsianLeop_n4.g.vcf.gz -O AsianLeop_n4.vcf.gz

