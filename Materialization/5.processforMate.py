import sys
a=open(sys.argv[1])
b=open(sys.argv[2],"w")
import pdb

#only for NELL KG
for line in a:
        row=line.split()
        head=row[0]
        rel=row[1]
        tail=row[2]
        #pdb.set_trace()
        rowHead=head.split(":")       
        rowTail=tail.split(":")

        b.write(rowHead[1]+"\t"+rel+"\t"+rowTail[1]+"\n")

b.close()

