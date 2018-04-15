############################################################################
# H.F. 20180326								   #
# 1. Get the quality score across all bases: Mean/Median                   #
# 2. Quality score distribution over all sequences                         #
# 3. GC distribution over all sequences			                   #
############################################################################

open source, 'HomoExonReads.fq';
open result, '>HomoExonReads.fq.qc';
@qc_base;
@qc_median;
@qc_seq;
@gc_seq;
$counter_seq = 0;

while( $seq_name = <source> ){
	$seq2 = <source>;
	$seq3 = <source>;
	$seq4 = <source>;
	
	
	# small sample for debug
	#if($counter_seq eq 200){
	#	last;
	#}


	#$counter_seq = 0;
	$counter_base = 0;
	$counter_median = 0;
	$last_base =0; # counter of cal median of all bases

	while($qc=substr($seq4, $counter_base, 1)){
	
		# QC sum of base in order
		$qc_base[$counter_base]=$qc_base[$counter_base]+ord($qc);
		
		# QC sum of a seq	
		$qc_seq[$counter_seq] = $qc_seq[$counter_seq] + ord($qc);
	
		# QC median
		#if($base>$last_base && $counter_median<length($seq4)/2){
		#	$counter_median = $counter_median+1;
		#	$qc_median[$counter_base];
		#}
		
		# GC
		if( substr($seq2,$counter_base, 1) eq 'C' ){
	 		$gc_seq[$counter_seq] = $gc_seq[$counter_seq]+1;
		}
		elsif(substr($seq2, $counter_base,1) eq 'G'){
	 		$gc_seq[$counter_seq] = $gc_seq[$counter_seq]+1;
		}
	
		$counter_base = $counter_base + 1;
	}

	print result "QC of".substr($seq_name, 0, 9)." ";
	print result $qc_seq[$counter_seq]/($counter_base+1)."\n";
	print result "GC of".substr($seq_name,0, 9)." ";
	print result $gc_seq[$counter_seq]/($counter_base+1)."\n";
	
	$counter_seq = $counter_seq+1;
}

# get the qc_base 

print result "QC_base:".$qc_base[2]/($counter_seq+1);

