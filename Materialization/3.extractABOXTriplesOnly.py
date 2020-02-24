#script for extracting just valid triples from AfterMatTriples.nt
import sys
a = open(sys.argv[1])
c = open(sys.argv[2],"w")
#a = open("/home/ktgroup/Documents/kems/experiment RQ1/EKAW2018/Mate-STransE/MateSTTriples.txt") file output dari jar nya extract triples
#c = open("/home/ktgroup/Documents/kems/experiment RQ1/EKAW2018/Mate-STransE/JustNewTriples.txt","w")


#the predicate of NELL/DBpedia ABOX triples is only the one that have dbpedia/nell ontology predicate
for line in a:
	row=line.split()
	#for dbpedia like this
	#if("dbpedia" in row[1]):

	#for NELL. like this
	if("ste-lod-crew.fr/nell/ontology" in row[1]):
		c.write(row[0]+"\t"+row[1]+"\t"+row[2]+"\n")

c.close()
