#script for merging the tbox and the abox part of dbpedia
import pdb
import sys

#b adalah NELL triples, sudah dalam format subject predicate object dan tanpa prefix. 
b = open(sys.argv[1])
#x = open("NELLTemp1.txt","w")#this file will be inserted manually to the tbox of NELL
x = open(sys.argv[2],"w")

seenTail = set()

for lineB in b:
	#pdb.set_trace()
	rowB = lineB.split()
	#rowB[0] adalah head entity, rowB[1] predicate, rowB[2] tail entity
	#format triple adalah sbb: city_friedman   agentbelongstoorganization      stateorprovince_times
	head = rowB[0].split(":") #head [0] adalah class, head[1] adalah instance
	tail = rowB[2].split(":") 
	# # http://www.co-ode.org/ontologies/ont.owl#LangsaAceh
	strComment1 = "# http://www.co-ode.org/ontologies/ont.owl#"+head[1]
	x.write(strComment1+"\n")
	x.write("\n")	

	# berikutnya tulis ini untuk setiap baris triple
	# <http://www.co-ode.org/ontologies/ont.owl#UmarKhayam> a owl:NamedIndividual , nellonto:person ;
        # nellonto:countrycurrency <http://www.co-ode.org/ontologies/ont.owl#LangsaAceh> .
	# <http://www.co-ode.org/ontologies/ont.owl#LangsaAceh> a owl:NamedIndividual , nellonto:beach .
	
	strHead = "<http://www.co-ode.org/ontologies/ont.owl#"+head[1]+"> a owl:NamedIndividual , nellonto:"+head[0]+" ;"
	x.write(strHead+"\n")
	strRel = "nellonto:"+rowB[1]+" <http://www.co-ode.org/ontologies/ont.owl#"+tail[1]+"> ."
	x.write(strRel+"\n")
	if tail[1] not in seenTail:
		seenTail.add(tail[1])
		strTail = "<http://www.co-ode.org/ontologies/ont.owl#"+tail[1]+"> a owl:NamedIndividual , nellonto:"+tail[0]+" ."
		x.write(strTail+"\n")
	#kelemahan code ini:
	#1. tail entity bisa ditulis berkali2 di file x
	#2. head entity yang muncul berkali2 di triple untuk predikat dan tail yang berbeda atau predikat sama tail berbeda 
	# akan ditulis berkali2 di file x (contoh: kem city london, kem school SD, kem school SMP, kem school SMA
	x.write("\n")
x.close()     
