#script for counting the predicates
import sys
a = open("InitialPoliticFromKB2E/forPBR.txt")

seen = set()
count=0

for line in a:
	row=line.split()
	if(row[1] not in seen):
		seen.add(row[1])
		count = count+1

print count
