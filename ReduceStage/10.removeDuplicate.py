import sys
a = open(sys.argv[1])
b = open(sys.argv[2],"w")

seen = set()
for line in a:
	if line not in seen:
		seen.add(line)
		b.write(line)

b.close()
