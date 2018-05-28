#Identifying H3K4me3 binding sites and simple annotation 

Public data from the article

Genome-wide incorporation dynamics reveal distinct categories of turnover for
the histone variant H3.3. Kraushaar DC, Jin W, Maunakea A, Abraham B, Ha M, 
Zhao K. Genome Biol. 2013;14(10):R121

H3K4me3 bed
https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1246686

Download the supplementary file GSM1246686_GA4961_MEF_H3K4me3.bed.gz

Peakcalling using MACS (please refer to the articles)

Download RefGene and do H3K4me3 peak annotation. How many H3K4me3 peaks 
overlapped with gene promoter?

## Exp
``` bash
sudo pip2 install MACS2
macs2 callpeak -t GSM1246686_GA4961_MEF_H3K4me3.bed
```

## Reference
https://fasta.bioch.virginia.edu/cshl/stubbs/peaks_genes_galaxy.html



