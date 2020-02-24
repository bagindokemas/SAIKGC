import sys
a=open(sys.argv[1])
b=open(sys.argv[2])

c = open(sys.argv[3],"w")

dictB = {}
for i2,line2 in enumerate(b):
	k2 = line2
	v2 = i2
	dictB[k2]=v2

for lineA in a:
	if lineA in dictB:
		c.write(lineA)

c.close()
