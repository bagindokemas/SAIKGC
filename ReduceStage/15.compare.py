import sys

a = open(sys.argv[1])
b = open(sys.argv[2])
new = open(sys.argv[3],"w") 


dictOld = {}
for iA,lineA in enumerate(a):
	kA = lineA
	vA = iA
	dictOld[kA] = vA

for lineB in b:
	if(lineB not in dictOld):	
		new.write(lineB)

new.close()

