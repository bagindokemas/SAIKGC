import sys

a=open(sys.argv[1])
b=open(sys.argv[2],"w")

seen=set()
for line in a:
	row=line.split()
	#row[0] is the head entity, row[1] is the predicate, row[2] is the tail entity
	head=row[0].split(":")
	#head[0] is the concept name, head[1] is the instance name
	tail=row[2].split(":")
	if row[0] not in seen:
		seen.add(row[0])
		b.write(head[1]+"\t"+head[0]+"\n")

	if row[2] not in seen:
                seen.add(row[2])
                b.write(tail[1]+"\t"+tail[0]+"\n")

b.close()
