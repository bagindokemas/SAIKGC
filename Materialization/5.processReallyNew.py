import sys
a=open(sys.argv[1])
b=open(sys.argv[2],"w")
import pdb

#for NELL KG only
for line in a:
	row=line.split()
	head=row[0]
	rel=row[1]
	tail=row[2]
	#pdb.set_trace()
	rowHead=head.split("#")
	rowRel=rel.split("<http://ste-lod-crew.fr/nell/ontology/")
	rowTail=tail.split("#")

	fixHead=rowHead[1][0:-1]
	fixRel=rowRel[1][0:-1]
	fixTail=rowTail[1][0:-1]
	
	b.write(fixHead+"\t"+fixRel+"\t"+fixTail+"\n")
	
b.close()
