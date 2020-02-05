# BSUB -J markdup.sh
# BSUB -o markdup.o
# BSUB -e markdup.e
# BSUB -q regularq
# BSUB -n 4

#Location of 
raw='/home/parashar/archive/chipseq/results/bowtie'
out='/home/parashar/scratch/bowtie/dedup'

##put the sample name in a file
##The sample file will be stored in current directory

##-I: input  ##
##-S: Output ##
cat name.txt | parallel "picard MarkDuplicates I=$raw/{}_sorted.bam O=$out/{}_dedup.bam M=$out/mark_dup_metrics.txt ASSUME_SORTED=true 2> $out/{}.stderr"
