#script for adding predicate resource/ontology to the triple
import sys

fileInput=open(sys.argv[1])
fileOutput=open(sys.argv[2],"w")

for line in fileInput:
	row = line.split()
	head = "http://ste-lod-crew.fr/nell/"+row[0]
	pred = "http://ste-lod-crew.fr/nell/ontology/"+row[1]
	tail = "http://ste-lod-crew.fr/nell/"+row[2]

	fileOutput.write(head+"\t"+pred+"\t"+tail+"\n")
	

fileOutput.close()
