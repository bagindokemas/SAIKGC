#script for adding predicate resource/ontology to the triple
import sys

fileInput=open(sys.argv[1])
fileOutput=open(sys.argv[2],"w")

for line in fileInput:
	row = line.split()
	pred = "http://ste-lod-crew.fr/nell/ontology/"+row[1]
	fileOutput.write(row[0]+"\t"+pred+"\t"+row[2]+"\n")
	

fileOutput.close()
