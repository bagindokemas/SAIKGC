#process the output like following
#sportsteam_pittsburgh_penguins	http://ste-lod-crew.fr/nell/ontology/teamplaysagainstteam	sportsteam_cardinals_27_23
#and turn it into sportsteam_pittsburgh_penguins	teamplaysagainstteam	sportsteam_cardinals_27_23
import sys

a = open(sys.argv[1])
b = open(sys.argv[2],"w")

for line in a:
	line=line.rstrip()
	row=line.split()
	head = row[0]
	pred = row[1].split("http://ste-lod-crew.fr/nell/ontology/")
	tail = row[2]

	b.write("<"+head+">"+"\t"+"<"+pred[1]+">"+"\t"+"<"+tail+">"+"\n")

b.close()
