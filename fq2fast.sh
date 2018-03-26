#!/bin/bash

FILE="GA7411_TGACCA_L007_R1_001.fastq"


let counter=0   # from transf fastq to single fastq
let counter1=1   # from counter total output
mkdir fastq_temp
mkdir fastqc_result
cat $FILE | while read LINE
do	
{	let tmp=counter%4
	let fastq_name=counter/4
	echo $LINE >> fastq_temp/$fastq_name
	#if [ $tmp == 3 ];then   # to 499

	if [ $tmp == 3 ];then   # to 499
		random=$RANDOM
		let you=ramdom/16383
		if [ you == 1 ];then  # random choose in 0 and 1
			f astqc fastq_temp/$fastq_name -o fastqc_result
			let counter1=counter1+1
		fi
	fi
		
	let counter=counter+1
	if [ $counter1 == 500 ];then
		rm fastq_temp/$fastq_name
		break
	fi
}
#done

function rand(){
	num=$RANDOM		
	let num=4000000*num/32767
	echo $num
}
