# BSUB -J plot_correlation.sh
# BSUB -o plot_corr.o
# BSUB -e plot_corr.e


##-in: Input core data                                                                                                                  ##
##-c: correlation method; pearson or spearman                                                                                           ##

#raw='/home/parashar/scratch'
#out='/home/parashar/scratch'

plotCorrelation -in bowtie_readCounts.npz -c pearson --skipZeros --plotTitle "Pearson Correlation of All Replicates and Input DNA" --plotNumbers --removeOutliers --whatToPlot heatmap -o Heatmap_All_Pearson_corr.png --outFileCorMatrix Heat_Pearson_Corr_matrix.tab

plotCorrelation -in bowtie_readCounts_excludeHTK27me3.npz -c pearson --skipZeros --plotTitle "Pearson Correlation of Replicates Excluding HTK27me3" --plotNumbers --removeOutliers --whatToPlot heatmap -o Heatmap_Excluding_HTK27me3_Pearson_corr.png --outFileCorMatrix Heat_Pearson_Corr_matrix_excludingHTK27me3.tab
