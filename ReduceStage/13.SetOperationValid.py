#from sets import Set
import sys

ori_all = set(open(sys.argv[1]))
invalid = set(open(sys.argv[2]))
unknownWO = set(open(sys.argv[3]))

c = open(sys.argv[4],"w")

validTriple = ori_all-invalid-unknownWO

for line in validTriple :
	c.write(line)

c.close()


