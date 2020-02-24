import sys

#a adalah valid labels dari hasil PBR,b adalah instanceClassinString
# c adalah file valid labels yang sudah ditambah label concept dan :
a = open(sys.argv[1])
b = open(sys.argv[2])
c = open(sys.argv[3],"w")

dictInstClass = {}
for lineB in b:
	rowB=lineB.split()
	k=rowB[0]
	v=rowB[1]
	dictInstClass[k]=v

for line in a: 
	row=line.split()
	#row[0] adalah instance head entity
	headString=""
	tailString=""
	if row[0] in dictInstClass:
		headClass=dictInstClass[row[0]]
		headString=headClass+":"+row[0]

	if row[2] in dictInstClass:
                tailClass=dictInstClass[row[2]]
                tailString=tailClass+":"+row[2]

	c.write(headString+"\t"+row[1]+"\t"+tailString+"\n")
c.close()
