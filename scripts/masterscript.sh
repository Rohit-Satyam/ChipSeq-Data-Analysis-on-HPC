#!/bin/bash

## Edit the path here

loc='/home/rohit/Music'

## Organising your data
mkdir -p $loc/chipseq $loc/chipseq/raw_data $loc/chipseq/indexes $loc/chipseq/QC $loc/chipseq/trimmomatic $loc/chipseq/alignments $loc/chipseq/plots $loc/chipseq/peak_call

echo -e "\e[1;33m The directories has been successfully created at $loc \e[0m"



## Quality control of Chip-data
read -e -p $'\e[31mTo perform FastQC: press y else n\e[0m: ' var


if [[ $var == y ]]
then
read -e -p "$'\e[31m For FastQC, enter file name(s)/pattern e.g. *.gz\e[0m: " var
echo -e fastqc -o $loc/chipseq/QC  $var 
fastqc -o $loc/chipseq/QC $var
elif [[ $var == n ]]
then
echo FastQC step skipped
fi





## Trim the adapter sequence
read -e -p $'\e[31m For Quality Trimming type "y" else n\e[0m: ' var
if [[ $var == y ]]
then
read -e -p $'\e[31m Is your data SE (single end) or PE (paired end)\e[0m: ' datatype

if [[ $datatype == SE ]]
then
read -e -p "For Single End data provide the following inputs separated by space: File name(s)/pattern (eg *_R1.gz), common suffix(eg *fastq.gz), adapter file as (ILLUMINACLIP:/path/Truseq3-SE.fa:2:30:10),sliding window( eg SLIDINGWINDOW:30:24), minimum length (eg MINLEN:70):" input pat adap sw len
for file in $input
do
name=$(basename ${file} $pat)
echo -e "\e[1;33m =======Adapter trimming started==========\e[0m"
echo trimmomatic SE ${file} $loc/chipseq/trimmomatic/${name}_trimed.fastq.gz $adap $sw $len 2> $loc/chipseq/trimmomatic/${name}.stderr
done
else
read -e -p "For Paired End data provide the following inputs separated by space. File name(s)/pattern (eg *_R1.gz), common suffix(eg *fastq.gz), adapter file as (ILLUMINACLIP:/path/Truseq3-SE.fa:2:30:10),sliding window( eg SLIDINGWINDOW:30:24), minimum length (eg MINLEN:70):" input pat adap sw len
mkdir $loc/chipseq/trimmomatic/trim_paired $loc/chipseq/trimmomatic/trim_unpaired
dirname=${input%/*}
for file in $input
do
name=$(basename ${file} $pat)
echo -e "\e[1;33m =======Adapter trimming started==========\e[0m"
echo trimmomatic PE ${file} $dirname/${name}${pat} $loc/chipseq/trimmomatic/trim_paired/${name}_R1_P.fastq.gz $loc/chipseq/trimmomatic/trim_unpaired/${name}_R1_UP.fastq.gz $loc/chipseq/trimmomatic/trim_paired/${name}_R2_P.fastq.gz $loc/chipseq/trimmomatic/trim_unpaired/${name}_R2_UP.fastq.gz $adap $sw $len 2> $loc/chipseq/trimmomatic/trim_paired/${name}.stderr
done
fi
elif [[ $var == n ]]
then
echo Trimming step skipped
fi


########## Alignment to the reference genome

## Alignment of samples to reference Genome using BWA MEM ##
read -e -p $'\e[31m To Perform alignment press y else n. The current pipeline employes bwa v0.7.17-r1188 as aligner . Also mention if the data is SE or PE\e[0m: ' var  datatype

if [[ $var == y && $datatype == SE ]]
then
read -e -p " You selected SE. For alignment, provide human reference genome index. eg.  /path/hg38.fa " index
ls -1 $loc/chipseq/trimmomatic/*.gz | xargs -n 1 basename| sort | uniq > $loc/chipseq/trimmomatic/input
while read q;
do
name=$(basename ${q} _trimed.fastq.gz);
echo -e =======Aligning sample $name ============;
echo "bwa mem $index $loc/chipseq/trimmomatic/$q > $loc/chipseq/alignments/$name.sam 2> $loc/chipseq/alignments/$name.stderr";
done < "$loc/chipseq/trimmomatic/input"
elif [[ $var == y && $datatype == PE ]]
then
read -e -p " You selected PE. For alignment, provide human reference genome index. eg.  /path/hg38.fa " index
ls -1 $loc/chipseq/trimmomatic/trim_paired/*_R1_P.fastq.gz | xargs -n 1 basename| sort | uniq > $loc/chipseq/trimmomatic/trim_paired/input
while read q;
do
name=$(basename $q _R1_P.fastq.gz);
bwa mem $index $loc/chipseq/trimmomatic/trim_paired/$q $loc/chipseq/trimmomatic/trim_paired/${name}_R2_P.fastq.gz > $loc/chipseq/alignments/$name.sam 2> $loc/chipseq/alignments/$name.stderr;
done < "$loc/chipseq/trimmomatic/trim_paired/input"
else
echo Skipped Alignment
fi
