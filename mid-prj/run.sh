#!/usr/bin/bash

#################################################
#    Magic script to change fq to vcf
#       By H.F. 20180427 Version 0.1
#################################################

perl bwt4fq.pl EcoTestRead2.fq phiX174.fa
perl sam2pile.pl
perl pile2vcf.pl
