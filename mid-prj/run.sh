#!/usr/bin/bash

#################################################
#    Magic script to change fq to vcf
#       By H.F. 20180427 Version 0.1
#################################################

perl 1_bwt4ref.pl phiX174.fa
perl sam2pile.pl
perl pile2vcf.pl
