#!/usr/bin/perl

#--------------------------------------------------------------------#
# Identify where the aligned reads differ from the reference gnome   #
# and write to a pileup file                                            #
# H.F. 20180427	Version 0.8                                          #
#--------------------------------------------------------------------#

open sam, 'Eco2.sam';
open vcf, '>Eco2.vcf';
open pileup, '>Eco2.pileup';
open genome, 'EscherGenome.fa';
open test, '>test';
@vcf_line;
@sam_line;
@ref_genome;
@pileup_align;

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
			#$pileup_line[0] = "Chrom";       # CHROM
	  	$base_pos = $sam_line[3];         # 1-based coordinate
			$base_pos_start = $base_pos;      # read start pont from sam
			#$pileup_line[3] = 0;             # number of reads covering the site

			# Align each base in same read
			while( $base_sam = substr($sam_line[9], $base_pos-$base_pos_start, 1)){
				$base_ref = substr($ref_genome[1], $base_pos-1, 1); # ref base
				if ( $base_sam eq $base_ref) {
					$pileup_align[$base_pos] = $pileup_align[$base_pos].'.';
				}
				else{
					$pileup_align[$base_pos] = $pileup_align[$base_pos].$base_sam;
				}
				#print $base_pos-$base_pos_start.'---'.$base_pos."\n";
				$base_pos = $base_pos+1;
			}
		}
}

# print the information to pileup file
foreach my $pos (1..$#pileup_align){
	my $id = 'CHROM';
	my $base_ref = substr($ref_genome[1], $pos-1, 1);
	my $result=@pileup_align[$pos];
	my $deepth = length($result);

	if( $result ne ''){
		print pileup join("\t",$id, $pos, $base_ref, $deepth, $result."\n");
	}
}
