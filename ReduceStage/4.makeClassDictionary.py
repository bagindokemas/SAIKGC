#make dictionary for DBPedia classes
import sys

x = open(sys.argv[1],"w")

with open('../TBOXesNELL/ListofClasses.txt') as a:
	seenClass=set()
	#i dimulai dari $numLineRelation
	i=int(sys.argv[2])
	for line in a:
		row=line.split()
		if(row[0] not in seenClass):
			seenClass.add(row[0])
			x.write(row[0]+"\t"+str(i)+"\n")		
			i += 1
		
x.close()
