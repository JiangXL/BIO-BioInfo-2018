#!/usr/bin/perl
################################################################################
# Export pileup file to vcf file.                                              #
# By H.F. 20180427 version 0.1                                                 #
################################################################################
open pileup, 'Eco2.pileup';
open vcf, '>Eco2.vcf';
print vcf join("\t",'#CHROM', 'POS','REF','ALT'."\n");

while ( $pileup_line = <pileup> ){
  my @pileup_line = split("\t", $pileup_line);
  my $id = $pileup_line[0];
  my $pos = $pileup_line[1];
  my $ref = $pileup_line[2];
  my $alt = '';
  my $result = $pileup_line[4];
  chomp $result;
  my $i = 0;

  while( $base = substr($result, $i, 1)){
    if( $base ne '.' ){
      $alt = $alt.$base;
    }
    $i++;
  }
  # Print vcf result to file
  if( $alt ne ''){
    print vcf join( "\t", $id, $pos, $ref,$alt);
    print vcf "\n";
  }
}
