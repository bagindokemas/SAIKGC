#from sets import Set
import sys

unknownWD = set(open(sys.argv[1]))
overlap = set(open(sys.argv[2]))

c = open(sys.argv[3],"w")

unknownWithoutOverlap = unknownWD-overlap 

for line in unknownWithoutOverlap:
	c.write(line)

c.close()


