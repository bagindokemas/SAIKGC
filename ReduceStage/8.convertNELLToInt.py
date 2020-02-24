#script untuk convert data NELL ke integer
import sys
a = open(sys.argv[1])
b = open(sys.argv[2])
c = open(sys.argv[3])
x = open(sys.argv[4],"w")

#make dictionary
InstanceDict = {}
for lineB in b:
	rowB = lineB.split()
	#kolom 1 adalah string Instance NELL 
	#kolom 2 adalah integer
	k1 = rowB[0] 
	v1 = rowB[1]
	InstanceDict[k1]=v1

RelationDict = {}
for lineC in c:
	rowC = lineC.split()
	#kolom 1 adalah string relation NELL 
	#kolom 2 adalah integer
	k2 = rowC[0] 
	v2 = rowC[1]
	RelationDict[k2]=v2

#a is the KG 
for lineA in a:
	cHead = 0
	cRel = 0
	cTail = 0
	rowA = lineA.split()
	if(rowA[0] in InstanceDict):
		head = InstanceDict[rowA[0]]		
		cHead+=1
	if(rowA[1] in RelationDict):
		rel = RelationDict[rowA[1]]
		cRel+=1
	if(rowA[2] in InstanceDict):
		tail = InstanceDict[rowA[2]]
		cTail+=1
	if(cHead+cRel+cTail==3):
		x.write(head+"\t"+rel+"\t"+tail+"\n")
		
x.close()
		
	
