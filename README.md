# GenomePlots
Various R scripts for plots related to genome-wide association analyses, especially applicable to a bacterial setting.
To include manhattan plots, qq-plots, allele frequency histograms, pairwise distance histograms and PCA plots.

**getITOL**
-------------
R functions to output sample names and colours according to genotype, in the format required by ITOL annotation files.  
Inputs are a binary matrix, position of the variant of interest
  
getSamplesVariant(mat, variant)  
getSamplesLocus(mat, genes.txt, variant)  
getITOL(mat, variant, label, colour, locus_based=F, genes.txt)  
  
**mat**  binary matrix  
**variant** position of variant of interest  
**label** label to be used in ITOL file  
**genes.txt** .txt file with no header, V1=chromosome, V2=position, V3=Rv number and V4=gene name.  
**colour** colour to be plottted on ITOL tree  
**locus_based** if =T any samples with a variant within the entire locus is identified   
