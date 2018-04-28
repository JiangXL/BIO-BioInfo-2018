
# Requirements
- Input: EcoTestRead2.fq
- Output: VCF files
- Integrate BWT in the alignment
- Allow one mismatch in the alignment
- Successfully call most mismatch
- No open source software
- Be capable to handle the human genome data, all analysis done in 12 hrs.

# Design
- Prel + sh + mulitprocess
- First use existive software to connect, then rewrite the software.
- Control the CPU and memory
- Chengwei Yu: Remove the intros on human genome and keep index.

# Files
| Files     | DescriptionS
|-----------|-------------
|run.sh     | All in one script
|sam2pile.pl|
|pile2vcf.pl|
|   |

# References
- https://en.wikipedia.org/wiki/Craig_Venter
- https://en.wikipedia.org/wiki/Phi_X_174
- https://zhuanlan.zhihu.com/p/27389007
- http://ft-sipil.unila.ac.id/dbooks/(ebook%20pdf)%20Teach%20Yourself%20Perl%20in%2021%20Days.pdf
- http://net.pku.edu.cn/~yhf/tutorial/perlstep/perlstep.html
- https://en.wikipedia.org/wiki/Pileup_format
