#script untuk mengubah tboxes ke format integer
import sys
import pdb
a = open(sys.argv[1])
b = open(sys.argv[2])
t1 = open("../TBOXesNELL/PrecomputeTBOX1.txt")
t2 = open("../TBOXesNELL/PrecomputeTBOX2.txt")
t3 = open("../TBOXesNELL/PrecomputeTBOX3.txt")
t4 = open("../TBOXesNELL/PrecomputeTBOX4.txt")
t5 = open("../TBOXesNELL/PrecomputeTBOX5.txt")
t6 = open("../TBOXesNELL/PrecomputeTBOX6.txt")
t7 = open("../TBOXesNELL/PrecomputeTBOX7.txt")
t8 = open("../TBOXesNELL/PrecomputeTBOX8.txt")
t9 = open("../TBOXesNELL/PrecomputeTBOX9.txt")
t10 = open("../TBOXesNELL/PrecomputeTBOX10.txt")
t11 = open("../TBOXesNELL/PrecomputeTBOX11.txt")
t12 = open("../TBOXesNELL/PrecomputeTBOX12.txt")

t1x = open(sys.argv[3],"w")
t2x = open(sys.argv[4],"w")
t3x = open(sys.argv[5],"w")
t4x = open(sys.argv[6],"w")
t5x = open(sys.argv[7],"w")
t6x = open(sys.argv[8],"w")
t7x = open(sys.argv[9],"w")
t8x = open(sys.argv[10],"w")
t9x = open(sys.argv[11],"w")
t10x = open(sys.argv[12],"w")
t11x = open(sys.argv[13],"w")
t12x = open(sys.argv[14],"w")


#make dictionary
ClassDict = {}
for lineA in a:
	rowA = lineA.split()
	#kolom 1 adalah string Class NELL 
	#kolom 2 adalah integer
	k1 = rowA[0] 
	v1 = rowA[1]
	ClassDict[k1]=v1

RelationDict = {}
for lineB in b:
	rowB = lineB.split()
	#kolom 1 adalah string relation NELL
	#kolom 2 adalah integer
	k2 = rowB[0] 
	v2 = rowB[1]
	RelationDict[k2]=v2

strListit1 = [] 
relt1 = ""
classDomt1 = ""
for linet1 in t1:
	rowt1 = linet1.split()
	listt1 = rowt1[2].split("\"")	
	if(rowt1[0] in RelationDict):
		relt1 = RelationDict[rowt1[0]]
	if(rowt1[1] in ClassDict):
		classDomt1 = ClassDict[rowt1[1]]

	for it1 in range(len(listt1)):
		if listt1[it1] in ClassDict:
			strListit1.append(ClassDict[listt1[it1]]+"\"")	

	strDisjointClasses = ''.join(strListit1)
	t1x.write(relt1+"\t"+classDomt1+"\t"+strDisjointClasses+"\n")
	#empty the list
	del strListit1[:]

strListit2 = [] 
relt2 = ""
classDomt2 = ""
for linet2 in t2:
	rowt2 = linet2.split()
	listt2 = rowt2[2].split("\"")	
	#pdb.set_trace()
	if(rowt2[0] in RelationDict):
		relt2 = RelationDict[rowt2[0]]
	if(rowt2[1] in ClassDict):
		classDomt2 = ClassDict[rowt2[1]]
	
	for it2 in range(len(listt2)):
		if listt2[it2] in ClassDict:
			#pdb.set_trace()
			strListit2.append(ClassDict[listt2[it2]]+"\"")	

	strDisjointClasses2 = ''.join(strListit2)
	t2x.write(relt2+"\t"+classDomt2+"\t"+strDisjointClasses2+"\n")
	#empty the list
	del strListit2[:]

for linet3 in t3:
	rowt3 = linet3.split()
	if rowt3[0] in RelationDict:
		relt3 = RelationDict[rowt3[0]]	
	t3x.write(relt3+"\n")

for linet4 in t4:
	rowt4 = linet4.split()
	if rowt4[0] in RelationDict:
		relt4 = RelationDict[rowt4[0]]	
	t4x.write(relt4+"\n")

relt5_1=""
relt5_2=""
for linet5 in t5:
	rowt5 = linet5.split()
	if rowt5[0] in RelationDict:
		relt5_1 = RelationDict[rowt5[0]]	
	if rowt5[1] in RelationDict:
		relt5_2 = RelationDict[rowt5[1]]	
	t5x.write(relt5_1+"\t"+relt5_2+"\n")

for linet6 in t6:
	rowt6 = linet6.split()
	if rowt6[0] in RelationDict:
		relt6_1 = RelationDict[rowt6[0]]	
	if rowt6[1] in RelationDict:
		relt6_2 = RelationDict[rowt6[1]]	
	t6x.write(relt6_1+"\t"+relt6_2+"\n")

for linet7 in t7:
	rowt7 = linet7.split()
	if rowt7[0] in RelationDict:
		relt7_1 = RelationDict[rowt7[0]]	
	if rowt7[1] in RelationDict:
		relt7_2 = RelationDict[rowt7[1]]	
	t7x.write(relt7_1+"\t"+relt7_2+"\n")

for linet8 in t8:
	rowt8 = linet8.split()
	if rowt8[0] in RelationDict:
		relt8 = RelationDict[rowt8[0]]	
	t8x.write(relt8+"\n")

for linet9 in t9:
	rowt9 = linet9.split()
	if rowt9[0] in RelationDict:
		relt9 = RelationDict[rowt9[0]]	
	t9x.write(relt9+"\n")

for linet10 in t10:
	rowt10 = linet10.split()
	if rowt10[0] in RelationDict:
		relt10 = RelationDict[rowt10[0]]	
	t10x.write(relt10+"\n")

for linet11 in t11:
        rowt11 = linet11.split()
        if rowt11[0] in RelationDict:
                relt11 = RelationDict[rowt11[0]]
        t11x.write(relt11+"\n")

for linet12 in t12:
        rowt12 = linet12.split()
        if rowt12[0] in RelationDict:
                if rowt12[1] in RelationDict:
                        relt12head = RelationDict[rowt12[0]]
                        relt12tail = RelationDict[rowt12[1]]
			
        t12x.write(relt12head+"\t"+relt12tail+"\n")


t1x.close()
t2x.close()
t3x.close()
t4x.close()
t5x.close()
t6x.close()
t7x.close()
t8x.close()
t9x.close()
t10x.close()
t11x.close()
t12x.close()

