#!/bin/bash
#SBATCH --job-name=GATK-jag
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
REFERENCE=../Panthera_onca_HiC.fasta
###Downsample
samtools view -b -s 0.33 SRR11097154_sorted.rg.bam > SRR11097154_sorted_rg_downsampled33.bam
samtools view -b -s 0.4 SRR14572000_sorted.rg.bam > SRR14572000_sorted_rg_downsampled40.bam
samtools view -b -s 0.4 SRR4444360_sorted.rg.bam > SRR4444360_sorted_rg_downsampled40.bam


#THREADS_BWA=46
#bwa index -a bwtsw $REFERENCE
#samtools faidx $REFERENCE
#java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar CreateSequenceDictionary R=$REFERENCE
#for file in *_sorted_B.bam;do
   bn=${file%?????????????}
   echo "Processing $bn"
   #bwa mem -t $THREADS_BWA $REFERENCE ${bn}_1.fastq.gz ${bn}_2.fastq.gz | samtools view -bS - | samtools sort - > ${bn}.sorted.bam
   #samtools index ${bn}_sorted_B.bam
   #java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar AddOrReplaceReadGroups I=${bn}_sorted_B.bam O=${bn}_sorted.rg.bam SORT_ORDER=coordinate RGID=${bn} RGLB=${bn} RGPL=illumina RGSM=${bn} RGPU=${bn} CREATE_INDEX=True
   #java -jar /oak/stanford/groups/dpetrov/armstrong/applications/picard.jar MarkDuplicates I=${bn}_sorted.rg.bam O=${bn}_sorted.rg.md.bam M=${bn}.metrics.md.txt
   #samtools index ${bn}_sorted.rg.md.bam
   gatk HaplotypeCaller -I ${bn}_sorted.rg.md.bam -O ${bn}.rg.md.haplotypecaller.g.vcf -ERC GVCF -R $REFERENCE
#done

##Split up genome
gatk --java-options "-Xmx200g -Xms200g" GenomicsDBImport -V SRR11097154_dwn33.rg.md.haplotypecaller.g.vcf -V SRR14572000_dwn40.rg.md.haplotypecaller.g.vcf -V SRR4444360_dwn40_sorted.rg.md.haplotypecaller.g.vcf  --genomicsdb-workspace-path Jaguar_n3_dwnSample_db_scaffold_1 -L HiC_scaffold_1
gatk --java-options "-Xmx200g -Xms200g" GenomicsDBImport -V SRR11097154_dwn33.rg.md.haplotypecaller.g.vcf -V SRR14572000_dwn40.rg.md.haplotypecaller.g.vcf -V SRR4444360_dwn40_sorted.rg.md.haplotypecaller.g.vcf  --genomicsdb-workspace-path Jaguar_n3_dwnSample_db_scaffold_2_5 -L IntervalList2_5.list
gatk --java-options "-Xmx200g -Xms200g" GenomicsDBImport -V SRR11097154_dwn33.rg.md.haplotypecaller.g.vcf -V SRR14572000_dwn40.rg.md.haplotypecaller.g.vcf -V SRR4444360_dwn40_sorted.rg.md.haplotypecaller.g.vcf  --genomicsdb-workspace-path Jaguar_n3_dwnSample_db_scaffold_6_19 -L IntervalList6_19.list
gatk --java-options "-Xmx200g -Xms200g" GenomicsDBImport -V SRR11097154_dwn33.rg.md.haplotypecaller.g.vcf -V SRR14572000_dwn40.rg.md.haplotypecaller.g.vcf -V SRR4444360_dwn40_sorted.rg.md.haplotypecaller.g.vcf  --genomicsdb-workspace-path Jaguar_n3_dwnSample_db_scaffold_middle30scaffolds -L IntervalList_middle30.list
gatk --java-options "-Xmx200g -Xms200g" GenomicsDBImport -V SRR11097154_dwn33.rg.md.haplotypecaller.g.vcf -V SRR14572000_dwn40.rg.md.haplotypecaller.g.vcf -V SRR4444360_dwn40_sorted.rg.md.haplotypecaller.g.vcf  --genomicsdb-workspace-path Jaguar_n3_dwnSample_db_scaffold_last90scaffolds -L IntervalList_last90.list
gatk GenotypeGVCFs -R ../Panthera_onca_HiC.fasta -V gendb://Jaguar_n3_dwnSample_db_scaffold_1 -O Jaguar_n3_dwnSample_db_scaffold_1.vcf
gatk GenotypeGVCFs -R ../Panthera_onca_HiC.fasta -V gendb://Jaguar_n3_dwnSample_db_scaffold_2_5 -O Jaguar_n3_dwnSample_db_scaffold_2_5.vcf
gatk GenotypeGVCFs -R ../Panthera_onca_HiC.fasta -V gendb://Jaguar_n3_dwnSample_db_scaffold_6_19 -O Jaguar_n3_dwnSample_db_scaffold_6_19.vcf
gatk GenotypeGVCFs -R ../Panthera_onca_HiC.fasta -V gendb://Jaguar_n3_dwnSample_db_scaffold_last90scaffolds -O Jaguar_n3_dwnSample_db_scaffold_last90.vcf
gatk GenotypeGVCFs -R ../Panthera_onca_HiC.fasta -V gendb://Jaguar_n3_dwnSample_db_scaffold_middle30scaffolds -O Jaguar_n3_dwnSample_db_scaffold_middle30.vcf

bcftools concat Jaguar_n3_dwnSample_db_scaffold_1.vcf Jaguar_n3_dwnSample_db_scaffold_2_5.vcf Jaguar_n3_dwnSample_db_scaffold_6_19.vcf Jaguar_n3_dwnSample_db_scaffold_middle30.vcf Jaguar_n3_dwnSample_db_scaffold_last90.vcf -o Jaguar_n3_dwnSample_allScaffolds -O z
#run this after everything completes in above steps
gatk CombineGVCFs -R $REFERENCE --variant SRR11097154.rg.md.haplotypecaller.g.vcf --variant SRR14572000.rg.md.haplotypecaller.g.vcf --variant SRR4444360.rg.md.haplotypecaller.g.vcf -O Jaguar_n3.g.vcf.gz
gatk --java-options "-Xmx4g" GenotypeGVCFs -R $REFERENCE -V Jaguar_n3.g.vcf.gz -O Jaguar_n3.vcf.gz

