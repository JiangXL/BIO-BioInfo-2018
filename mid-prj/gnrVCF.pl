#!/usr/bin/perl

#--------------------------------------------------------------------#
# Identify where the aligned reads differ from the reference gnome   #
# and write to a VCF file                                            #
# H.F. 20180415	Version 0.2                                          #
#--------------------------------------------------------------------#

open sam, 'Eco2.sam';
open vcf, '>Eco2.vcf';
open pileup, 'Eco2.pileup';
open genome, 'EscherGenome.fa';
open test, '>test';
@vcf_line;
@sam_line;
@ref_genome;
@pileup_line;

# Preprocess thegenome sequence
$ref_genome[0] = <genome>;
while ( $ref = <genome> ){
	chomp $ref;
	$ref_genome[1] = $ref_genome[1].$ref;
}

# Generate Pileup file from sam file
while ( $sam_line =  <sam> ){ 
		@sam_line= split("\t",$sam_line);
		if ( (substr($sam_line, 0, 1 ) ne '@') && $sam_line[3] ne '0'){
			# unexpend the sam info
			$pileup_line[0] = "Chrom";       # CHROM
	  	$pileup_line[1] = $sam_line[3];  # 1-based coordinate
			$pileup_line[3] = 0;             # number of reads covering the site
			$pileup_line[4] = "";            # mapping result
			while( $base_sam = substr($sam_line[9], $pileup_line[1]-$sam_line[3], 1)){
				$pileup_line[2] = substr($ref_genome[1], $pileup_line[1]-1, 1); # ref base
				if ( $base_sam eq $pileup_line[2]){
					$pileup_line[3] = $pileup_line[2] +1;
				}
				else{
					$pileup_line[4] = $pileup_line[4].$base_sam;
				}	
				$pileup_line[1] = $pileup_line[1]+1;
			}
			print join("\t",@pileup_line);
			print "\n";
		}
}
