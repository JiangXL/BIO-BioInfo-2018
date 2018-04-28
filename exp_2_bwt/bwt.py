"""
B-W Transform by H.F. 20180305 
Reference from Wikipedia
Version: 0.3.2
"""
###########################################################################
# use:    Burrows-Wheeler Transform function
# input:  single sequence 
# reture: none
def bwt(s):
	result = open('bwt_moyj_result.txt','a') # open file in 'a' mode
	result.write("Origin Sequence:\n")       # record and add origin 
	result.write(s)							 # sequence to file

	# Extend all the sequence in a circle
	s = s.strip('\n')                             	# remove all '\n'
	table = [s[i:] + s[:i] for i in range(len(s))]  # 
	
	# Get the sort result
	table_sorted = table[:]                  # just copy the table to another
	table_sorted.sort()						 # use python function to sort

	#indexlist = []							 # code for future
	#for t in table_sorted:			
	#	index1 = table.index(t)
	#	index1 = index1 + 1 if index1 < len(s)-1 else 0
	#	index2 = table_sorted.index(table[index1])
	#	indexlist.append(index2)
	
	# write to result from last word of each row
	r = ''.join([row[-1] for row in table_sorted]) # generate final sequence
	result.write("After BWT:\n")				   # record and add final
	result.write(r+"\n")                           # sequece with "\n"
	#return r, indexlist						   # code for future
	result.close()								   # close file

##################################USER Configure#############################

seq_file = open("GA7411_TGACCA_L007_R1_001.fastq") # input fastq file 
counter = 3										   # just a simple counter 
for seq in seq_file:							   # read a line each time	
	if (counter%4 == 0 ):							   # if the line is 
		bwt(seq)								   # sequence, do BWT		
	elif (counter-3)%4 ==0 :						   # friendly interface for
		print("processing No."+ str((counter-3)//4) +":" + seq) # user
	counter = counter + 1 							   # ++	 
