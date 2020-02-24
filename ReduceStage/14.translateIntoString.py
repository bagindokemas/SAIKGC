#"Mate1BigData/endOfIteration/script untuk convert data int ke string
import sys
a = open(sys.argv[1])
b = open(sys.argv[2])
c = open(sys.argv[3])
d = open(sys.argv[4],"w")

#the columns are instance label and ID
instanceDict={}
for lineB in b:
	rowB=lineB.split()
	k1=rowB[1]
	v1=rowB[0]
	instanceDict[k1]=v1

#the columns are relation label and ID
relationDict={}
for lineC in c:
	rowC=lineC.split()
	k2=rowC[1]
	v2=rowC[0]
	relationDict[k2]=v2

for lineA in a:
	cHead = 0
	cRel = 0
	cTail = 0
	rowA=lineA.split()
	if rowA[0] in instanceDict:
		cHead+=1
		head=instanceDict[rowA[0]]
	if rowA[1] in relationDict:
		cRel+=1
		rel=relationDict[rowA[1]]
	if rowA[2] in instanceDict:
		cTail+=1
		tail=instanceDict[rowA[2]]
	if(cHead+cRel+cTail==3):
		d.write(head+"\t"+rel+"\t"+tail+"\n")
		
d.close()



