## Scripts Using miniconda environments

# Conversion of SAM to BAM and coordinates based sorting
ls -1 *.sam > sam_input

#note: Dont run sambamba with GNU parallel as it's memory footprint is very high

for file in `cat sam_input`
do
name=$(basename ${file} .sam)
samtools view -Sb $file | sambamba sort > $name.bam
done

ls -1 *.bam > bam_input

## Alignment_Stats
cat bam_input | parallel "samtools flagstat {}"

## mark_duplicates
for file in `cat bam_input`
name=$(basename ${file} .bam)
picard MarkDuplicates I=$file O=$name.bam M=$name.marked_dup_metrics.txt ASSUME_SORT_ORDER=coordinate TAGGING_POLICY=All TAG_DUPLICATE_SET_MEMBERS=true 2> $name.stderr
done
