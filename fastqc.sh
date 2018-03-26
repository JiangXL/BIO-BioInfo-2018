#!/bin/bash

FILE="GA7411_TGACCA_L007_R1_001.fastq"


echo "Now printing name and length of sequence to file result.txt"
let counter=0

mkdir fastq_temp
mkdir fastqc_result
cat $FILE | while read LINE
do	
{	let tmp=counter%4
	let fastq_name=counter/4
	echo $LINE >> fastq_temp/$fastq_name
	if [ $tmp == 3 ];then   # to 499
		fastqc fastq_temp/$fastq_name -o fastqc_result
	fi		
	let counter=counter+1
	if [ $fastq_name == 500 ];then
		rm fastq_temp/$fastq_name
		break
	fi
}
done

#function rand(){
#	let min=0
#	let max=7800
#	num=$
#	
#}
