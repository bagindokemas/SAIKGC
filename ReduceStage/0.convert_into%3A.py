import sys
import pdb

a=open(sys.argv[1])
b=open(sys.argv[2],"w")

#input sport_jumping_jack
#output sport:jumping_jack

list1=[]

for line in a:
	row=line.split()
	#row[0] is the head, row[1] is the predicate, row[2] is the tail
	head=row[0].split("_") 
	lengthHead=len(head)
	#head[0] is a class label, head[1] and so on are the instance
	#pdb.set_trace()
	rowHeadRest = ""
	for i in range(1,lengthHead):
		if i != lengthHead:
			rowHeadRest = rowHeadRest+head[i]+"_"
		else:
			rowHeadRest = rowHeadRest	

	strHead = head[0]+":"+rowHeadRest
	strHeadFix = strHead[:-1] 
	#print strHead[:-1]
	
	tail=row[2].split("_")
	lengthTail=len(tail)
	rowTailRest = ""
	for i in range(1,lengthTail):
                if i != lengthTail:
                        rowTailRest = rowTailRest+tail[i]+"_"
                else:
                        rowTailRest = rowTailRest

        strTail = tail[0]+":"+rowTailRest
        strTailFix = strTail[:-1]
	b.write(strHeadFix+"\t"+row[1]+"\t"+strTailFix+"\n")

b.close()
