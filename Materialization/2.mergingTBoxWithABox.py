#script for merging 2 files in specific line
#fp = open("../DBPED-p/Temp2.txt","r")
import sys
fp = open(sys.argv[1],"r")
# fp is file1
data = fp.read()

#f = open('../DBPED-p/DBPEDp.owl', 'r+')
f = open(sys.argv[2],'r+')
#ingat, lokasi dbpediaOntGood ada di /home/ktgroup/Documents/kems/experiment RQ1/ISWC2018/DBPedia/MergingData
#f is file2 on which you want to write data
ss = f.readlines()

f.seek(0)
f.truncate()
ss.insert(14905,data)
#start from line 54643 for dbpedia, and start from 14905 for NELL
f.write(''.join(ss))
