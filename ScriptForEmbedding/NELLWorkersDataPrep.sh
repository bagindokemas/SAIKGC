python 0.removeConceptFromKG.py NewForTransC.txt NewForTransCV2.txt
python 1.makeInstanceDictionary.py NewForTransCV2.txt instanceDict.txt
python 2.makeNELLRelationDictionary.py  RelationDict.txt 0
python 3.makeNELLClassDictionary.py  ClassDict.txt 0
python 4.makeNELLInstClassMapping.py instanceDict.txt ClassDict.txt Instance_Class.txt
python 5.produceTriple2id.py NewForTransCV2.txt instanceDict.txt RelationDict.txt triple2idx.txt
python 6.produceSubClassOf.py ClassDict.txt NELLSubClassOf2simple.txt subClassOf2idx.txt
python 6.changeTabToSpace.py Instance_Class.txt instanceOf2id.txt
python 6.changeTabToSpace.py subClassOf2idx.txt subClassOf2id.txt
python 7.addCharForTransCFormat.py instanceDict.txt instance2idx.txt
python 7.addCharForTransCFormat.py ClassDict.txt concept2idx.txt
python 7.addCharForTransCFormat.py RelationDict.txt relation2idx.txt
python 8.add1LineForFiles.py instance2idx.txt instance2id.txt
python 8.add1LineForFiles.py concept2idx.txt concept2id.txt
python 8.add1LineForFiles.py relation2idx.txt relation2id.txt

#sampai di sini kita punya triple2id.txt yang harus dipecah jadi 5 bagian
#split -da 1 -n r/5 triple2idx.txt
cp triple2idx.txt ../TransC-2/KemScriptForTransC/

#mv x0 ../TransC-1/KemScriptForTransC/
#mv x1 ../TransC-2/KemScriptForTransC/
#mv x2 ../TransC-3/KemScriptForTransC/
#mv x3 ../TransC-4/KemScriptForTransC/
#mv x4 ../TransC-5/KemScriptForTransC/

#cp concept2id.txt ../TransC-1/data/NELL/Train/
#cp concept2id.txt ../TransC-2/data/NELL/Train/
#cp concept2id.txt ../TransC-3/data/NELL/Train/
#cp concept2id.txt ../TransC-4/data/NELL/Train/
mv concept2id.txt ../TransC-2/data/NELL/Train/

#cp instance2id.txt ../TransC-1/data/NELL/Train/
#cp instance2id.txt ../TransC-2/data/NELL/Train/
#cp instance2id.txt ../TransC-3/data/NELL/Train/
#cp instance2id.txt ../TransC-4/data/NELL/Train/
mv instance2id.txt ../TransC-2/data/NELL/Train/

#cp relation2id.txt ../TransC-1/data/NELL/Train/
#cp relation2id.txt ../TransC-2/data/NELL/Train/
#cp relation2id.txt ../TransC-3/data/NELL/Train/
#cp relation2id.txt ../TransC-4/data/NELL/Train/
mv relation2id.txt ../TransC-2/data/NELL/Train/

#cp subClassOf2id.txt ../TransC-1/data/NELL/Train/
#cp subClassOf2id.txt ../TransC-2/data/NELL/Train/
#cp subClassOf2id.txt ../TransC-3/data/NELL/Train/
#cp subClassOf2id.txt ../TransC-4/data/NELL/Train/
mv subClassOf2id.txt ../TransC-2/data/NELL/Train/

#cp instanceOf2id.txt ../TransC-1/data/NELL/Train/
#cp instanceOf2id.txt ../TransC-2/data/NELL/Train/
#cp instanceOf2id.txt ../TransC-3/data/NELL/Train/
#cp instanceOf2id.txt ../TransC-4/data/NELL/Train/
mv instanceOf2id.txt ../TransC-2/data/NELL/Train/

#semua worker punya data DBpedia, kemudian setiap worker harus process data menjadi 90% training dan 5% valid, 5% test
#rename triple2id.txt menjadi KGE$Ite1




