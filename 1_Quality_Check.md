For Detailed account Please refer here

Symptoms That your Chip-seq have more duplicates than required
1. 

## Related Literature
 
## Histone markes can be narrow and broad:<br/>
Refer to encode [guidelines](https://www.encodeproject.org/chip-seq/histone/)

## Sufficient Sequencing depth<br/>
1. ∼20 million reads: for H3K4me3 <br/> 
2. ∼40 million: for H3K36me3 & H3K27me3 <br/>
> Based on these results, we suggest that 40–50 million reads is a practical minimum depth for human marks, except for few special cases such as H3K9me3 that cover very large contiguous domains. [Source](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4027199/)

## Recent advances in ChIP-seq analysis: from quality management to whole-genome annotation ([source](https://academic.oup.com/bib/article/18/2/279/2453282))

>The chromatin accessibility during fragmentation is not uniform across the genome. In some open-chromatin regions (e.g. actively transcribed promoter regions), DNA is amenable to fragmentation and thereby preferentially represented in the fragmented sample, which causes false-positive read enrichment. **Tightly packed regions, e.g. heterochromatin, are sheared to a lesser extent by DNA fragmentation, thereby confounding weak enrichment of true binding sites for heterochromatin markers.** These fragmentation biases in a genome-wide read distribution profile should be taken into account when using null model analysis to obtain meaningful conclusions. **One way to mitigate this fragmentation bias is to shear longer DNA fragments (350∼800 bp) further using ultrasonication after the immunoprecipitation step. Although including longer fragments widens the obtained peaks, peak-summit resolution is not strongly affected.** <br/>

**Deep sequencing better for broad histone marks:**

> **The number of called peaks increases with the sequencing depth, because weaker sites become statistically significant with a greater number of reads** . Although early ChIP-seq analyses produced <10 million reads per sample, it was reported that some highly active regions displayed a modest ChIP enrichment and that weak protein binding by other factors may have important subfunctions. **Therefore, deep sequencing** is required to include all functional sites. **Broad markers that cover large genomic areas require more depth than those of sharp-mode peaks**.

>Naked genomic DNA is less appropriate as a control because the input sample reflects the GC bias and chromatin structure rather than naked DNA. It was also reported that histone H3 ChIP-seq data can be used as a control. ChIP samples for non-DNA-binding proteins, e.g. IgG, are often used to detect nonspecific binding sites.........**We believe that in the majority of cases the choice of which background sample is used will make a negligible difference to the results. Therefore, the use of WCE or input as a standard control sample is well justified.**[Source](https://www.frontiersin.org/articles/10.3389/fgene.2014.00329/full)
