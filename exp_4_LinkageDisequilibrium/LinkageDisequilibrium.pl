open SNP_FILE, 'ld_data.txt';

@snp1 = split ' ', <SNP_FILE>;
@snp2 = split ' ', <SNP_FILE>;
@snp3 = split ' ', <SNP_FILE>;

$position = 1;
$TTT=0;
$TTC=0;
$TGC=0;
$TGT=0;
$CTC=0;
$CTT=0;
$CGC=0;
$CGT=0;


while($position<=40){
    
    $snp1=substr($snp1[$position],0,1).substr($snp2[$position],0,1).substr($snp3[$position],0,1);
    $snp2=substr($snp1[$position],1,1).substr($snp2[$position],1,1).substr($snp3[$position],1,1);
    
    if($snp1 eq 'TTT'){
	$TTT=$TTT+1}
    elsif( $snp1 eq 'TTC'){
        $TTC=$TTC+1}
    elsif( $snp1 eq 'TGC'){
	$TGC=$TGC+1}
    elsif( $snp1 eq 'TGT'){
	$TGT=$TGT+1}
    elsif( $snp1 eq 'CTC'){
	$CTC=$CTC+1}
    elsif( $snp1 eq 'CTT'){
	$CTT=$CTT+1}
    elsif( $snp1 eq 'CGC'){
	$CGC=$CGC+1}
    elsif( $snp1 eq 'CGT'){
	$CGT=$CGT+1}
 
    if($snp2 eq 'TTT'){
	$TTT=$TTT+1}
    elsif( $snp2 eq 'TTC'){
        $TTC=$TTC+1}
    elsif( $snp2 eq 'TGC'){
	$TGC=$TGC+1}
    elsif( $snp2 eq 'TGT'){
	$TGT=$TGT+1}
    elsif( $snp2 eq 'CTC'){
	$CTC=$CTC+1}
    elsif( $snp2 eq 'CTT'){
	$CTT=$CTT+1}
    elsif( $snp2 eq 'CGC'){
	$CGC=$CGC+1}
    elsif( $snp2 eq 'CGT'){
	$CGT=$CGT+1}

    $position=$position+1;
}

open result, '>ld_result.txt';
print result "TTT: ".$TTT."\n";
print result "TTC: ".$TTC."\n";
print result "TGC: ".$TGC."\n";
print result "TGT: ".$TGT."\n";
print result "CTC: ".$CTC."\n";
print result "CTT: ".$CTT."\n";
print result "CGC: ".$CGC."\n";
print result "CGT: ".$CGT."\n";
