import sys

a=open(sys.argv[1])
b=open(sys.argv[2],"w")

for line in a:
	#format input s o p
	#format output s p o
	row=line.split()
	b.write(row[0]+"\t"+row[2]+"\t"+row[1]+"\n")	

b.close()
