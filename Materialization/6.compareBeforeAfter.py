#script for comparing triples before and after materialisation
import pdb
import sys

a = open(sys.argv[1])
b = open(sys.argv[2])
new = open(sys.argv[3],"w")

#a = open("/home/ktgroup/Documents/kems/experiment RQ1/EKAW2018/Mate-STransE/inputMate.txt")
#b = open("/home/ktgroup/Documents/kems/experiment RQ1/EKAW2018/Mate-STransE/JustNewTriples.txt")
#new = open("/home/ktgroup/Documents/kems/experiment RQ1/EKAW2018/Mate-STransE/ReallyNew.txt","w")

#compare the current new triples with previous iteration
#a = open("../DBPedia/Mate1bigdata/iteration1/OuputMate.txt")
#b = open("../DBPedia/Mate2bigdata/iteration3/NewIt3-NewIte2.txt")
#new = open("../DBPedia/Mate2bigdata/iteration3/NewIt3-NewIte1.txt","w")

dictOld = {}
for iA,lineA in enumerate(a):	
	kA = lineA
	vA = iA
	dictOld[kA]=vA

for lineB in b:	
	if(lineB not in dictOld):
		#pdb.set_trace()
		new.write(lineB)

new.close()
