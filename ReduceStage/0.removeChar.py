import sys
#script untuk remove '<' dan '>'

fileInput=open(sys.argv[1])
fileOutput=open(sys.argv[2],"w")

for line in fileInput:
	line=line.rstrip()
	row=line.split()
	head=row[0][1:-1]
	pred=row[1][1:-1]
	tail=row[2][1:-1]
	fileOutput.write(head+"\t"+pred+"\t"+tail+"\n")

fileOutput.close()
