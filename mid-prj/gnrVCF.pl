#!/usr/bin/perl

#--------------------------------------------------------------------#
# Identify where the aligned reads differ from the reference gnome   #
# and write to a VCF file                                            #
# H.F. 20180415	Version 0.1                                          #
#--------------------------------------------------------------------#

open sam, 'Eco2.sam';
open vcf, '>Eco2.vcf';
open pipeup, 'Eco2.pipeup';
open genome, 'EscherGenome.fa';
open test, '>test';
@vcf_line;
@sam_line;
@ref_genome;
@pipeup_line;

# Preprocess thegenome sequence
$ref_genome[0] = <genome>;
while ( $ref = <genome> ){
	chomp $ref;
	$ref_genome[1] = $ref_genome[1].$ref;
}

# Generate Pileup file from sam file
while ( $sam_line =  <sam> ){
	if ( substr($sam_line, 0, 1 ) ne '@'){
		# unexpend the sam info
		@sam_line= split("\t",$sam_line);
		$pipup_line[0] = "Chrom";  # CHROM
		$pipup_line[4] = 0; 			#the number of reads covering the site
		while( $sam_line[3] ne '0'){ # remove unmapped seq
			
			$pipup_line[1] = $sam_line[3]; # 1-based coordinate
			$pipup_line[2] = $sam_line[0]; # reference base
			$pipup_line[4] = $pipup_line[4] +1;
			$pipup_line[3] = ;# read bases

			# find and qurery in geome (Assume only a ref sequence on fasta file)
				print substr($ref_genome[1], $vcf_line[1]-1, length($sam_line[9]) );
				print "\n";
 				print pipeup join("\t",@pipeup_line)."\n";
	}
	}
}
