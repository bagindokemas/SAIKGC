#script ini untuk membuat dictionary DBPEdia
import sys

output = open(sys.argv[2],"w")

with open(sys.argv[1]) as a:
	seen=set()
	#seenRel = set()
	i = 0
	for line in a:
		row=line.split()
		headEntity=row[0].split(":")		
		if(headEntity[1] not in seen):
			seen.add(headEntity[1])
			output.write(headEntity[1]+"\t"+str(i)+"\n")		
			i += 1
		
		#if(row[1] not in seenRel):
		#	seenRel.add(row[1])
		#	output.write(row[1]+"\t"+str(i)+"\n")		
		#	i += 1
		tailEntity=row[2].split(":")
		if(tailEntity[1] not in seen):
			seen.add(tailEntity[1])
			output.write(tailEntity[1]+"\t"+str(i)+"\n")
			i += 1

output.close

	

