# Requirements
- Input: EcoTestRead2.fq
- Output: VCF files
- Integrate BWT in the alignment
- Allow one mismatch in the alignment
- Successfully call most mismatch
- No open source software

# Design
- Prel + sh + mulitprocess
- First use existive software to connect, then rewrite the software.
- Control the CPU and memory
