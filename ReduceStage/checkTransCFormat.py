a = open("/uoa/home/r01krw16/sharedscratch/CARRELTransC/TransC-2/data/MRDBped/Train/concept2id.txt")

for line in a:
	row=line.split()
	length=len(row)
	if length<2:
		print line
