import sys

a = open(sys.argv[1])
b = open(sys.argv[2])
c = open(sys.argv[3],"w")

dictIdeal={}
for iB,lineB in enumerate(b):
	#rowB = lineB.split()
	k = lineB
	v = iB
	dictIdeal[k]=v

for line in a:
	row=line.split()
	if line not in dictIdeal:		
		c.write(row[0]+"\t"+row[1]+"\t"+row[2]+"\n")

c.close()	
