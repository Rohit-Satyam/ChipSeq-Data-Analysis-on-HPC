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


bamPEFragmentSize -hist bowtie_fragmentSize.png -T "Fragment size of PE Chip-seq data" --maxFragmentLength 1000 -b HTH3_S1_sorted.bam HTIGG_S10_sorted.bam HTK27AC-1_S11_sorted.bam HTK27AC-2_S12_sorted.bam HTK27ME3-1_S9_sorted.bam HTK27ME3-2_S6_sorted.bam HTK4ME1-1_S2_sorted.bam HTK4ME1-2_S3_sorted.bam --samplesLabel HTH3_S1 HTIGG_S10 HTK27AC_1_S11 HTK27AC_2_S12 HTK27ME3_1_S9 HTK27ME3_2_S6 HTK4ME1_1_S2 HTK4ME1_2_S3 --table bowtie_fragmentSize.txt --outRawFragmentLengths rawfragmentlength.txt
