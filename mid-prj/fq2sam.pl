#!/usr/bin/perl

#--------------------------------------------------------------------#
# Align the sequences to reference genome, generate BAM or CRAM files#
# H.F. 20180428 Version 0.1                                                      #
#--------------------------------------------------------------------#

open fq, 'EcoTestRead2.fq';
open genome, 'phiX174.fa';
open sam, '>Eco2_test.sam';
@genome;

# Preprocess the genome sequence: delete \n""
$genome[0] = <genome>;
chomp $genome[0];
while($ref = <genome>){
	chomp $ref;
	$genome[1] = $genome[1].$ref;
}

$seq_debug = substr($genome[1],0,70);

bwt();


sub bwt(){
	my @bwm;
	while($bwm_col = substr($seq_debug,0,1)){
		
	}
	
}
