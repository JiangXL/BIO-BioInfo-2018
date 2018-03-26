"""
B-W Transform by H.F. 20180312
Reference from Wikipedia
Version: 0.4.1
"""
###########################################################################
# use:    Burrows-Wheeler Transform function
# input:  single sequence 
# reture: none
def bwt(s):
	result = open('bwt_moyj_result.txt','a') # open file in 'a' mode
	result_index = open('bwt_index_moyj_result.txt','a') # open file in 'a' mode
	result.write("Origin Sequence:\n")       # record and add origin 
	result.write(s+"\n")				 # sequence to file

	# Extend all the sequence in a circle
	s = s.strip('\n')                             	# remove all '\n'
	table = [s[i:] + s[:i] for i in range(len(s))]  # 
	
	# Get the sort result
	table_sorted = table[:]             # just copy the table to another
	table_sorted.sort()	            # use python function to sort

	indexlist = []			
	for t in table_sorted:			
		index1 = table.index(t) 
		index1 = index1 + 1 if index1 < len(s)-1 else 0
		index2 = table_sorted.index(table[index1])
		indexlist.append(index2)
		result_index.write(str(index2)+',')
	
	# write to result from last word of each row
	r = ''.join([row[-1] for row in table_sorted]) # generate final sequence
	result.write("After BWT:\n")	               # record and add final
	result.write(r+"\n")                           # sequece with "\n"
	#return r, indexlist			       # code for future
	result.close()				       # close file
	result_index.close()

##################################USER Configure#############################

seq_file = open("EscherGenome.fa")                 # input fa file 

print("Seq"+seq_file.readline())

seq_total = ''
for seq in seq_file:				   # read a line each time	
	seq=seq.strip('\n')
	seq_total=seq_total+seq
	
bwt(seq_total)			                   #  do BWT		
