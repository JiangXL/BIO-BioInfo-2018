#!/bin/bash

FILE="GA7411_TGACCA_L007_R1_001.fastq"

let tmp=0
let tmp1=0

echo "Now printing name and length of sequence to file result.txt"
echo "It may take long time for export all the sequence, you can "
echo "stop at any time by type CTRL+C"
cat $FILE | while read LINE
do	
{	let tmp=count%4
	if [ $tmp == 0 ];then
		echo $LINE >> result.txt
	#	echo $LINE 
	elif [ $tmp == 1 ];then
		echo $LINE | wc -L >> result.txt
	#	echo $LINE | wc -L 
	fi
let count=count+1
}
done


