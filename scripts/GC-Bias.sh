# BSUB -J fragmentsize.sh
# BSUB -o fragmentsize.o
# BSUB -e fragmentsize.e
# BSUB -q regularq
# BSUB -m node14
# BSUB -n 8
##bins: The coverage calculation is done for consecutive bins of equal size (10 kilobases by default)                                   ##
##-b: List of indexed bam files separated by spaces.                                                                                    ##
##outRawCounts: Save the counts per region to a tab-delimited file.                                                                     ##      

#raw='/home/parashar/archive/chipseq/results/bam_correlation_analysis'
#out='/home/parashar/archive/chipseq/results/bam_correlation_analysis'


computeGCBias -b file.bam --effectiveGenomeSize 2150570000 -g mm9.2bit -l 200 --GCbiasFrequenciesFile freq.txt
