import sys
#a is the initial KG with concept name 
#b is the initial KG without concept name

a = open(sys.argv[1])
b = open(sys.argv[2],"w")

for line in a:
	row=line.split()
	head=row[0].split(":")
	tail=row[2].split(":")
	b.write(head[1]+"\t"+row[1]+"\t"+tail[1]+"\n")	

b.close()
