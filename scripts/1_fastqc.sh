# BSUB -J fastqc.sh
# BSUB -o sam_to_bam.o
# BSUB -e sam_to_bam.e
# BSUB -q regularq
# BSUB -n 4

## Parameters Used ##
#-o Output directory
#--nogroup: To prevent binning; useful to see per base quality. Note: Use only on few files with small read length; Increases computation time.  

input=$1

fastqc -o QC_results/ --nogroup $input 2> fastqc.stderr
