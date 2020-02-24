import sys

a=open(sys.argv[1])
b=open(sys.argv[2],"w")

for line in a:
	#input dalam format subj pred obj score dan pemisah tab \t
	#output dalam format subj obj pred dan pemisah tab ' '
	row=line.split()
	b.write(row[0]+' '+row[2]+' '+row[1]+"\n")

b.close()
