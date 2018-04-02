# Exp.6: SAM File
  
Yuejian Mo,11510511

## Introduction
CIGAR (Compact Idiosyncratic Gapped Alignment Report) is 

> What is a CIGAR?
You may have heard the term CIGAR, but wondered what it means. Hopefully this section will help clarify it.

The sequence being aligned to a reference may have additional bases that are not in the reference or may be missing bases that are in the reference. The CIGAR string is a sequence of of base lengths and the associated operation. They are used to indicate things like which bases align (either a match/mismatch) with the reference, are deleted from the reference, and are insertions that are not in the reference.

For example:

RefPos:     1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19
Reference:  C  C  A  T  A  C  T  G  A  A  C  T  G  A  C  T  A  A  C
Read: ACTAGAATGGCT
Aligning these two:

RefPos:     1  2  3  4  5  6  7     8  9 10 11 12 13 14 15 16 17 18 19
Reference:  C  C  A  T  A  C  T     G  A  A  C  T  G  A  C  T  A  A  C
Read:                   A  C  T  A  G  A  A     T  G  G  C  T
With the alignment above, you get:

POS: 5
CIGAR: 3M1I3M1D5M
The POS indicates that the read aligns starting at position 5 on the reference. The CIGAR says that the first 3 bases in the read sequence align with the reference. The next base in the read does not exist in the reference. Then 3 bases align with the reference. The next reference base does not exist in the read sequence, then 5 more bases align with the reference. Note that at position 14, the base in the read is different than the reference, but it still counts as an M since it aligns to that position.



## Part I
1. Here are 11 reads in the data.
2. Here are 6 unmapped reads.
3. Here are types of quality score.
4. Here are 3 different CIGAR string. 
5. Here are 0 read align to the reverse strand 
6. Here are 6 MAPQ of 0. These read can be aligned equally well to multiple 
positions.

## Part II
1. The number of uniquely mapped reads is 11.
2. The number of high quality alignments is 9.
3.1. Here are 5 reads fall within start site.
3.2. The position of each read

``` bash
ididid	1
iddddidid	71
ST-E00493:120:H7MNWALXX:8:1101:1235:1450	0
ST-E00493:120:H7MNWALXX:8:1101:2087:1450	0
ST-E00493:120:H7MNWALXX:8:1101:1448:1467	0
ST-E00493:120:H7MNWALXXTTT1	281
ST-E00493:120:H7MNWALXXTTT2	281
ST-E00493:120:H7MNWALXXTTT3	1961
ST-E00493:120:H7MNWALXXTTT4	2101
ST-E00493:120:H7MNWALXXTTT5	2101
ST-E00493:120:H7MNWALXXTTT6	2311
ST-E00493:120:H7MNWALXXTTT7	2661
ST-E00493:120:H7MNWALXXTTT8	2941
ST-E00493:120:H7MNWALXXTTT9	3081
ST-E00493:120:H7MNWALXX:8:1101:13585:1538	0
ST-E00493:120:H7MNWALXX:8:1101:14052:1538	0
ST-E00493:120:H7MNWALXX:8:1101:14235:1538	0
```
3.3.
``` bash
ididid	1
iddddidid	71
ST-E00493:120:H7MNWALXXTTT1	281
ST-E00493:120:H7MNWALXXTTT2	281
ST-E00493:120:H7MNWALXXTTT3	1961
```

## Reference
https://genome.sph.umich.edu/wiki/SAM
