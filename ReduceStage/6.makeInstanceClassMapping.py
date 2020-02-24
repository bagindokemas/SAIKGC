#script for linking instance and class 
import sys
import pdb
#a is instance dictionary, b is class dictionary,c is instance_class mapping dalam string, d is instance class mapping dalam integer
a = open(sys.argv[1])
b = open(sys.argv[2])
c = open(sys.argv[3])
d = open(sys.argv[4],"w")

#asumsi: tidak ada instance yang menjadi anak dari kelas yang berbeda
#algoritma:
#for each line in a, take the instance label and search in c the class label for it
#after getting the class label, search the id of the class label in b,
#output the second column of a and the second column of b to file d

instanceClassDict = {}
for lineC in c:
	rowC = lineC.split()
	#kolom 1 adalah string instance dan kolom 2 adalah string class
	k = rowC[0]
	v = rowC[1]
	instanceClassDict[k]=v

classDict = {}
for lineB in b:
	rowB = lineB.split()
	#kolom 1 adalah string Class NELL 
	#kolom 2 adalah integer
	k = rowB[0] 
	v = rowB[1]
	classDict[k]=v

values = ""
for lineA in a:
	#a punya 2 kolom
	#nama_instance dan ID instance, seperti= aberdeen 16
	rowA = lineA.split()
	#pdb.set_trace()
	if rowA[0] in instanceClassDict:
		#ambil string class nya
		values = instanceClassDict[rowA[0]]
		if values in classDict:
			IDClass=classDict[values]
		
			d.write(rowA[1]+"\t"+IDClass+"\n")

d.close()		
