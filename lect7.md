# Lect 7: Variant calling and output format

Data visualization tools: UCSC Genome Browser, WashU EpiGenome Browser, IGV,
Bamview

Single-nucleotide variant(SNV): a variant in an individual sequence
Single-nucleotide polymorphism: a variant in polymorphic within a population.
Structural variation: variation in structure of an organism's chromosome,
including deletion, duplications, copy-number variants, intsertions, invserions
and translocations. 

**Variant calling** is the process by which we identify variants from sequence
data. In other words:
> Ignoring for the moment everything but SNVs, our goal is to characterize 
each column of the alignment as homozygous wildtype (aa), heterozygous (ab), 
or homozygous variant (bb) ---Peter N Robinson

For whole genome or exome variant calling we follow a three step process:
- Carry out whole genome or whole exome sequencing to create FASTQ files.
- Align the sequences to a reference genome, creating BAM or CRAM files.
- Identify where the aligned reads differ from the reference genome and write
to a VCF file.

**Pileup format** is first used by Tony Cox and Zemin Ning at the Sanger 
Institute. It desribes the base-pair information at each chromosomal position.
This format facilitates SNP/indel calling and brief alignment viewing by eyes.

The pileup format has several variants. The default output by SAMtools looks
like this
``` bash
seq1 272 T 24  ,.$.....,,.,.,...,,,.,..^+. <<<+;<<<<<<<<<<<=<;<;7<&
seq1 273 T 23  ,.....,,.,.,...,,,.,..A <<<;<<<<<<<<<3<=<<<;<<+
seq1 274 T 23  ,.$....,,.,.,...,,,.,...    7<7;<;<<<<<<<<<=<;<;<<6
seq1 275 A 23  ,$....,,.,.,...,,,.,...^l.  <+;9*<<<<<<<<<=<<:;<<<<
seq1 276 G 22  ...T,,.,.,...,,,.,....  33;+<<7=7<<7<&<<1;<<6<
seq1 277 T 22  ....,,.,.,.C.,,,.,..G.  +7<;<<<<<<<&<=<<:;<<&<
seq1 278 G 23  ....,,.,.,...,,,.,....^k.   %38*<<;<7<<7<=<<<;<<<<<
seq1 279 C 23  A..T,,.,.,...,,,.,..... ;75&<<<<<<<<<=<<<9<<:<<
```
where each line consists of chromosome, 1-based coordinate, reference base,
the number of reads covering the site, read bases and base qualities. At the
read base column, a _dot_ stands for a match to the reference base on the 
forward strand, a _comma_ for a match on the reverse strand, `ACGTN' for a
mismatch on the forward strand and `acgtn' for a mismatch on the reverse
strand. A pattern `\+[0-9]+[ACGTNacgtn]+' indicates there is an insertion
between this reference position and the next reference position. 
The length of the insertion is given by the integer in the pattern, 
followed by the inserted sequence. Here is an example of 2bp insertions on 
three reads:
``` 
seq2 156 A 11  .$......+2AG.+2AG.+2AGGG    <975;:<<<<<
```
Similarly, a pattern `-[0-9]+[ACGTNacgtn]+' represents a deletion from the
reference. Here is an exmaple of a 4bp deletions from the reference, 
supported by two reads:
```
seq3 200 A 20 ,,,,,..,.-4CACC.-4CACC....,.,,.^~. ==<<<<<<<<<<<::<;2<<
```
Also at the read base column, a symbol `^' marks the start of a read segment
which is a contiguous subsequence on the read separated by `N/S/H' CIGAR 
operations. The ASCII of the character following `^' minus 33 gives the
mapping quality. A symbol `$' marks the end of a read segment. Start and end
markers of a read are largely inspired by Phil Green's CALF format. These
markers make it possible to reconstruct the read sequences from pileup.
SAMtools can optionally append mapping qualities to each line of the output.
This makes the output much larger, but is necessary when a subset of sites
are selected.

Beta Function

VCF is the standard file format for storing variation data. VCF is a tab
delimited text format (most likely stroed in a compressed manner). Many 
millions of variants can be strored in a single VCF file.
| Column |   Content   | Description
|--------|-------------|------------
| #CHROM | Chromsome   | 
| POS    | Co-ordinate | The start coordinate of the variant
| ID     | Identifer   | 
| REF    | Reference allele   | The reference allele is whatever is found in the reference genome. It is not necessarily the major allele
| ALT    | Alternative allele | The alternative allele is the allele found in the sample you are studying.
| QUAL   | Score       | Quality score out of 100
| FILTER | Pass/fail   | If it passed quality filters
| INFO   | Further infor | llows you to provide further information on the variants. Keys in the INFO field can be defined in header lines above the table.
| FORMAT | Information about the following columns | The GT in the FORMAT column tells us to expect genotypes in the following columns.
| NA19909| Individual identifier(optioal) |The previous column told us to expect to see genotypes here. The genotype is in the form 0|1, where 0 indicates the reference allele and 1 indicates the alternative allele, i.e it is heterozygous. The vertical pipe | indicates that the genotype is phased, and is used to indicate which chromosome the alleles are on. If this is a slash / rather than a vertical pipe, it means we don’t know which chromosome they are on.


```
#CHROM POS ID REF ALT QUAL FILTER INFO FORMAT NA00001 NA00002 NA00003
20 14370 rs6054257 G A 29 PASS NS=3;DP=14;AF=0.5;DB;H2 GT:GQ:DP:HQ 0|0:48:1:51,51 1|0:48:8:51,51 1/1:43:5:.,.
20 17330 . T A 3 q10 NS=3;DP=11;AF=0.017 GT:GQ:DP:HQ 0|0:49:3:58,50 0|1:3:5:65,3 0/0:41:3
20 1110696 rs6040355 A G,T 67 PASS NS=2;DP=10;AF=0.333,0.667;AA=T;DB GT:GQ:DP:HQ 1|2:21:6:23,27 2|1:2:0:18,2 2/2:35:4
20 1230237 . T . 47 PASS NS=3;DP=13;AA=T GT:GQ:DP:HQ 0|0:54:7:56,60 0|0:48:4:51,51 0/0:61:2
20 1234567 microsat1 GTC G,GTCT 50 PASS NS=3;DP=9;AA=G GT:GQ:DP 0/1:35:4 0/2:17:2 1/1:40:3 
```


# Reference
http://samtools.sourceforge.net/pileup.shtml
https://www.ebi.ac.uk/training/online/course/human-genetic-variation-i-introduction/variant-identification-and-analysis/what-variant
