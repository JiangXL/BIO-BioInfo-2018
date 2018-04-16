#!/bin/perl
#--------------------------------------------------------------------#
# Identify where the aligned reads differ from the reference gnome   #
# and write to a VCF file                                            #
# H.F. 20180415	Version 0.1                                          #
#--------------------------------------------------------------------#
use Text::Tabs;

print "Figure up\n";

open sam, 'Eco2.sam';

@vcf_line;
@sam_line;

while ( $sam_line =  <sam> ){
	$len = @sam_line;
	if ( substr($sam_line, 0, 1 ) ne '@'){
		@
		push @sam_line, $sam_line;
 		print substr($sam_line, 0,1);
		print $len."\n";
	}
}
