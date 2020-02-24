#make dictionary for NELL relation
import sys

x = open(sys.argv[1],"w")

with open('../TBOXesNELL/ListofRelations.txt') as a:
	seenRel=set()
	#i dimulai dari $numLineInstance
	i=int(sys.argv[2])
	for line in a:
		row=line.split()
		if(row[0] not in seenRel):
			seenRel.add(row[0])
			x.write(row[0]+"\t"+str(i)+"\n")		
			i += 1
		
x.close()
