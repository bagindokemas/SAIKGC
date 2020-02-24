function APR {
	#APR untuk hasil NELL dari RULES
	numberPart=$1
	j=$2
	mkdir ../../CARRELTransC/DataMRCombination/outputRLIte$j

	if [ $numberPart -eq 1 ]
	then
		mv RULES2/data/NELL/new_facts.txt RULES2/data/NELL/outRULES2.txt
		cp RULES2/data/NELL/outRULES2.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES2.txt
		cd /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination
		mv outputRLIte$j/outRULES2.txt outputRLIte$j/mergeTriples.txt 
		cd /uoa/home/r01krw16/sharedscratch/MapReduceCARREL/RULES/
		cp RULES2/data/NELL/ideal.data.txt ../../CARRELTransC/DataMRCombination/outputRLIte$j/
		cd /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination/outputRLIte$j/
		mv ideal.data.txt mergeInitial.txt
	elif [ $numberPart -eq 5 ]
	then
		mv RULES1/data/NELL/new_facts.txt RULES1/data/NELL/outRULES1.txt
		mv RULES2/data/NELL/new_facts.txt RULES2/data/NELL/outRULES2.txt
		mv RULES3/data/NELL/new_facts.txt RULES3/data/NELL/outRULES3.txt
		mv RULES4/data/NELL/new_facts.txt RULES4/data/NELL/outRULES4.txt
		mv RULES5/data/NELL/new_facts.txt RULES5/data/NELL/outRULES5.txt
		cp RULES1/data/NELL/outRULES1.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES1.txt
		cp RULES2/data/NELL/outRULES2.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES2.txt
		cp RULES3/data/NELL/outRULES3.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES3.txt
		cp RULES4/data/NELL/outRULES4.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES4.txt
		cp RULES5/data/NELL/outRULES5.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES5.txt
		cd /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination
		cat outputRLIte$j/outRULES1.txt outputRLIte$j/outRULES2.txt outputRLIte$j/outRULES3.txt outputRLIte$j/outRULES4.txt outputRLIte$j/outRULES5.txt > outputRLIte$j/mergeTriples.txt		     #check whether the output of all producers really different with the input of all producers.
		cd /uoa/home/r01krw16/sharedscratch/MapReduceCARREL/RULES/
		cat RULES1/data/NELL/ideal.data.txt RULES2/data/NELL/ideal.data.txt RULES3/data/NELL/ideal.data.txt RULES4/data/NELL/ideal.data.txt RULES5/data/NELL/ideal.data.txt > ../../CARRELTransC/DataMRCombination/outputRLIte$j/mergeInitial.txt
	elif [ $numberPart -eq 6 ]
	then
		mv RULES1/data/NELL/new_facts.txt RULES1/data/NELL/outRULES1.txt
                mv RULES2/data/NELL/new_facts.txt RULES2/data/NELL/outRULES2.txt
                mv RULES3/data/NELL/new_facts.txt RULES3/data/NELL/outRULES3.txt
                mv RULES4/data/NELL/new_facts.txt RULES4/data/NELL/outRULES4.txt
                mv RULES5/data/NELL/new_facts.txt RULES5/data/NELL/outRULES5.txt
		mv RULES6/data/NELL/new_facts.txt RULES6/data/NELL/outRULES6.txt
                cp RULES1/data/NELL/outRULES1.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES1.txt
                cp RULES2/data/NELL/outRULES2.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES2.txt
                cp RULES3/data/NELL/outRULES3.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES3.txt
                cp RULES4/data/NELL/outRULES4.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES4.txt
                cp RULES5/data/NELL/outRULES5.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES5.txt
                cp RULES6/data/NELL/outRULES6.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES6.txt
		cd /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination
                cat outputRLIte$j/outRULES1.txt outputRLIte$j/outRULES2.txt outputRLIte$j/outRULES3.txt outputRLIte$j/outRULES4.txt outputRLIte$j/outRULES5.txt outputRLIte$j/outRULES6.txt > outputRLIte$j/mergeTriples.txt                 
		#check whether the output of all producers really different with the input of all producers.
		cd /uoa/home/r01krw16/sharedscratch/MapReduceCARREL/RULES/                
		cat RULES1/data/NELL/ideal.data.txt RULES2/data/NELL/ideal.data.txt RULES3/data/NELL/ideal.data.txt RULES4/data/NELL/ideal.data.txt RULES5/data/NELL/ideal.data.txt RULES6/data/NELL/ideal.data.txt > ../../CARRELTransC/DataMRCombination/outputRLIte$j/mergeInitial.txt
	elif [ $numberPart -eq 7 ] 
	then
		mv RULES1/data/NELL/new_facts.txt RULES1/data/NELL/outRULES1.txt
                mv RULES2/data/NELL/new_facts.txt RULES2/data/NELL/outRULES2.txt
                mv RULES3/data/NELL/new_facts.txt RULES3/data/NELL/outRULES3.txt
                mv RULES4/data/NELL/new_facts.txt RULES4/data/NELL/outRULES4.txt
                mv RULES5/data/NELL/new_facts.txt RULES5/data/NELL/outRULES5.txt
                mv RULES6/data/NELL/new_facts.txt RULES6/data/NELL/outRULES6.txt
                mv RULES7/data/NELL/new_facts.txt RULES7/data/NELL/outRULES7.txt
		cp RULES1/data/NELL/outRULES1.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES1.txt
                cp RULES2/data/NELL/outRULES2.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES2.txt
                cp RULES3/data/NELL/outRULES3.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES3.txt
                cp RULES4/data/NELL/outRULES4.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES4.txt
                cp RULES5/data/NELL/outRULES5.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES5.txt
                cp RULES6/data/NELL/outRULES6.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES6.txt
                cp RULES7/data/NELL/outRULES7.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES7.txt
		cd  /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination
                cat outputRLIte$j/outRULES1.txt outputRLIte$j/outRULES2.txt outputRLIte$j/outRULES3.txt outputRLIte$j/outRULES4.txt outputRLIte$j/outRULES5.txt outputRLIte$j/outRULES6.txt outputRLIte$j/outRULES7.txt > outputRLIte$j/mergeTriples.txt                 
		#check whether the output of all producers really different with the input of all producers.
                cd /uoa/home/r01krw16/sharedscratch/MapReduceCARREL/RULES/
		cat RULES1/data/NELL/ideal.data.txt RULES2/data/NELL/ideal.data.txt RULES3/data/NELL/ideal.data.txt RULES4/data/NELL/ideal.data.txt RULES5/data/NELL/ideal.data.txt RULES6/data/NELL/ideal.data.txt RULES7/data/NELL/ideal.data.txt > ../../CARRELTransC/DataMRCombination/outputRLIte$j/mergeInitial.txt
	elif [ $numberPart -eq 8 ]
	then
		mv RULES1/data/NELL/new_facts.txt RULES1/data/NELL/outRULES1.txt
                mv RULES2/data/NELL/new_facts.txt RULES2/data/NELL/outRULES2.txt
                mv RULES3/data/NELL/new_facts.txt RULES3/data/NELL/outRULES3.txt
                mv RULES4/data/NELL/new_facts.txt RULES4/data/NELL/outRULES4.txt
                mv RULES5/data/NELL/new_facts.txt RULES5/data/NELL/outRULES5.txt
                mv RULES6/data/NELL/new_facts.txt RULES6/data/NELL/outRULES6.txt
                mv RULES7/data/NELL/new_facts.txt RULES7/data/NELL/outRULES7.txt
		mv RULES8/data/NELL/new_facts.txt RULES8/data/NELL/outRULES8.txt
                cp RULES1/data/NELL/outRULES1.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES1.txt
                cp RULES2/data/NELL/outRULES2.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES2.txt
                cp RULES3/data/NELL/outRULES3.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES3.txt
                cp RULES4/data/NELL/outRULES4.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES4.txt
                cp RULES5/data/NELL/outRULES5.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES5.txt
                cp RULES6/data/NELL/outRULES6.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES6.txt
                cp RULES7/data/NELL/outRULES7.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES7.txt
                cp RULES8/data/NELL/outRULES8.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES8.txt
		cd /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination
                cat outputRLIte$j/outRULES1.txt outputRLIte$j/outRULES2.txt outputRLIte$j/outRULES3.txt outputRLIte$j/outRULES4.txt outputRLIte$j/outRULES5.txt outputRLIte$j/outRULES6.txt outputRLIte$j/outRULES7.txt outputRLIte$j/outRULES8.txt > outputRLIte$j/mergeTriples.txt                 
		#check whether the output of all producers really different with the input of all producers.
		cd /uoa/home/r01krw16/sharedscratch/MapReduceCARREL/RULES/                
		cat RULES1/data/NELL/ideal.data.txt RULES2/data/NELL/ideal.data.txt RULES3/data/NELL/ideal.data.txt RULES4/data/NELL/ideal.data.txt RULES5/data/NELL/ideal.data.txt RULES6/data/NELL/ideal.data.txt RULES7/data/NELL/ideal.data.txt RULES8/data/NELL/ideal.data.txt > ../../CARRELTransC/DataMRCombination/outputRLIte$j/mergeInitial.txt
	elif [ $numberPart -eq 9 ]
	then
		mv RULES1/data/NELL/new_facts.txt RULES1/data/NELL/outRULES1.txt
                mv RULES2/data/NELL/new_facts.txt RULES2/data/NELL/outRULES2.txt
                mv RULES3/data/NELL/new_facts.txt RULES3/data/NELL/outRULES3.txt
                mv RULES4/data/NELL/new_facts.txt RULES4/data/NELL/outRULES4.txt
                mv RULES5/data/NELL/new_facts.txt RULES5/data/NELL/outRULES5.txt
                mv RULES6/data/NELL/new_facts.txt RULES6/data/NELL/outRULES6.txt
                mv RULES7/data/NELL/new_facts.txt RULES7/data/NELL/outRULES7.txt
                mv RULES8/data/NELL/new_facts.txt RULES8/data/NELL/outRULES8.txt
		mv RULES9/data/NELL/new_facts.txt RULES9/data/NELL/outRULES9.txt
                cp RULES1/data/NELL/outRULES1.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES1.txt
                cp RULES2/data/NELL/outRULES2.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES2.txt
                cp RULES3/data/NELL/outRULES3.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES3.txt
                cp RULES4/data/NELL/outRULES4.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES4.txt
                cp RULES5/data/NELL/outRULES5.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES5.txt
                cp RULES6/data/NELL/outRULES6.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES6.txt
                cp RULES7/data/NELL/outRULES7.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES7.txt
                cp RULES8/data/NELL/outRULES8.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES8.txt
                cp RULES9/data/NELL/outRULES9.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES9.txt
		cd /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination
                cat outputRLIte$j/outRULES1.txt outputRLIte$j/outRULES2.txt outputRLIte$j/outRULES3.txt outputRLIte$j/outRULES4.txt outputRLIte$j/outRULES5.txt outputRLIte$j/outRULES6.txt outputRLIte$j/outRULES7.txt outputRLIte$j/outRULES8.txt outputRLIte$j/outRULES9.txt > outputRLIte$j/mergeTriples.txt                 
		#check whether the output of all producers really different with the input of all producers.
		cd /uoa/home/r01krw16/sharedscratch/MapReduceCARREL/RULES/
		cat RULES1/data/NELL/ideal.data.txt RULES2/data/NELL/ideal.data.txt RULES3/data/NELL/ideal.data.txt RULES4/data/NELL/ideal.data.txt RULES5/data/NELL/ideal.data.txt RULES6/data/NELL/ideal.data.txt RULES7/data/NELL/ideal.data.txt RULES8/data/NELL/ideal.data.txt RULES9/data/NELL/ideal.data.txt > ../../CARRELTransC/DataMRCombination/outputRLIte$j/mergeInitial.txt
	elif [ $numberPart -eq 10 ]
	then
		mv RULES1/data/NELL/new_facts.txt RULES1/data/NELL/outRULES1.txt
                mv RULES2/data/NELL/new_facts.txt RULES2/data/NELL/outRULES2.txt
                mv RULES3/data/NELL/new_facts.txt RULES3/data/NELL/outRULES3.txt
                mv RULES4/data/NELL/new_facts.txt RULES4/data/NELL/outRULES4.txt
                mv RULES5/data/NELL/new_facts.txt RULES5/data/NELL/outRULES5.txt
                mv RULES6/data/NELL/new_facts.txt RULES6/data/NELL/outRULES6.txt
                mv RULES7/data/NELL/new_facts.txt RULES7/data/NELL/outRULES7.txt
                mv RULES8/data/NELL/new_facts.txt RULES8/data/NELL/outRULES8.txt
                mv RULES9/data/NELL/new_facts.txt RULES9/data/NELL/outRULES9.txt
                mv RULES10/data/NELL/new_facts.txt RULES10/data/NELL/outRULES10.txt
		cp RULES1/data/NELL/outRULES1.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES1.txt
                cp RULES2/data/NELL/outRULES2.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES2.txt
                cp RULES3/data/NELL/outRULES3.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES3.txt
                cp RULES4/data/NELL/outRULES4.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES4.txt
                cp RULES5/data/NELL/outRULES5.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES5.txt
                cp RULES6/data/NELL/outRULES6.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES6.txt
                cp RULES7/data/NELL/outRULES7.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES7.txt
                cp RULES8/data/NELL/outRULES8.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES8.txt
                cp RULES9/data/NELL/outRULES9.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES9.txt
                cp RULES10/data/NELL/outRULES10.txt  ../../CARRELTransC/DataMRCombination/outputRLIte$j/outRULES10.txt
		cd /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination
                cat outputRLIte$j/outRULES1.txt outputRLIte$j/outRULES2.txt outputRLIte$j/outRULES3.txt outputRLIte$j/outRULES4.txt outputRLIte$j/outRULES5.txt outputRLIte$j/outRULES6.txt outputRLIte$j/outRULES7.txt outputRLIte$j/outRULES8.txt outputRLIte$j/outRULES9.txt outputRLIte$j/outRULES10.txt > outputRLIte$j/mergeTriples.txt                 
		#check whether the output of all producers really different with the input of all producers.
                cd /uoa/home/r01krw16/sharedscratch/MapReduceCARREL/RULES/
		cat RULES1/data/NELL/ideal.data.txt RULES2/data/NELL/ideal.data.txt RULES3/data/NELL/ideal.data.txt RULES4/data/NELL/ideal.data.txt RULES5/data/NELL/ideal.data.txt RULES6/data/NELL/ideal.data.txt RULES7/data/NELL/ideal.data.txt RULES8/data/NELL/ideal.data.txt RULES9/data/NELL/ideal.data.txt RULES10/data/NELL/ideal.data.txt > ../../CARRELTransC/DataMRCombination/outputRLIte$j/mergeInitial.txt
	fi

	#pindah dari folder RULES/ ke folder ReduceStageNELL/
	cd /uoa/home/r01krw16/sharedscratch/CARRELTransC/ReduceStageNELL/
	#mergeTriples.txt berisi 4 kolom, padahal kita hanya proses 3 kolom, maka kita reduksi menjadi 3 kolom
	python checkNewData_1.py ../DataMRCombination/outputRLIte$j/mergeTriples.txt ../DataMRCombination/outputRLIte$j/mergeTriples3cols.txt

	#check whether there is duplicate/overlap triples among the outputs
	python 10.removeDuplicate.py ../DataMRCombination/outputRLIte$j/mergeTriples3cols.txt ../DataMRCombination/outputRLIte$j/newTriplesWO.txt	
	python 12.SetOperation.py ../DataMRCombination/outputRLIte$j/mergeTriples3cols.txt ../DataMRCombination/outputRLIte$j/newTriplesWO.txt ../DataMRCombination/outputRLIte$j/OverlapTriplesFromMerge.txt

	#check whether the output of all producers really different with the input of all producers.
	python 15.compare.py ../DataMRCombination/outputRLIte$j/mergeInitial.txt ../DataMRCombination/outputRLIte$j/newTriplesWO.txt ../DataMRCombination/outputRLIte$j/forPBR.txt
	#NewForPBR sudah tidak memiliki karakter <> <> <>, sehingga removeChar tidak diperlukan lagi
	#python 0.removeChar.py ../DataMRCombination/outputRLIte$j/NewForPBR.txt ../DataMRCombination/outputRLIte$j/newTriplesReady.txt

	python 2.makeInstanceDictionary.py ../DataMRCombination/outputRLIte$j/forPBR.txt ../DataMRCombination/outputRLIte$j/NELLInstanceDictionary.txt
	#list of relation dari lokasi lain
	#hitung dulu berapa baris file instance
	numLineInstance=$(python countLine.py ../DataMRCombination/outputRLIte$j/NELLInstanceDictionary.txt)
        python 3.makeRelationDictionary.py ../DataMRCombination/outputRLIte$j/NELLRelationDict.txt $numLineInstance
	numLineClass=$((numLineInstance+numLineRelation))
	python 4.makeClassDictionary.py ../DataMRCombination/outputRLIte$j/NELLClassDict.txt $numLineClass
	python 5.makeInstanceClassFile.py ../DataMRCombination/outputRLIte$j/forPBR.txt ../DataMRCombination/outputRLIte$j/NELLInstClassString.txt
	python 6.makeInstanceClassMapping.py ../DataMRCombination/outputRLIte$j/NELLInstanceDictionary.txt ../DataMRCombination/outputRLIte$j/NELLClassDict.txt ../DataMRCombination/outputRLIte$j/NELLInstClassString.txt ../DataMRCombination/outputRLIte$j/Instance_Class.txt
	python 9.convertTBOXESintoInt.py ../DataMRCombination/outputRLIte$j/NELLClassDict.txt ../DataMRCombination/outputRLIte$j/NELLRelationDict.txt ../DataMRCombination/outputRLIte$j/TBOX1inInt ../DataMRCombination/outputRLIte$j/TBOX2inInt ../DataMRCombination/outputRLIte$j/TBOX3inInt ../DataMRCombination/outputRLIte$j/TBOX4inInt ../DataMRCombination/outputRLIte$j/TBOX5inInt ../DataMRCombination/outputRLIte$j/TBOX6inInt ../DataMRCombination/outputRLIte$j/TBOX7inInt ../DataMRCombination/outputRLIte$j/TBOX8inInt ../DataMRCombination/outputRLIte$j/TBOX9inInt ../DataMRCombination/outputRLIte$j/TBOX10inInt ../DataMRCombination/outputRLIte$j/TBOX11inInt ../DataMRCombination/outputRLIte$j/TBOX12inInt
	python 7.removeConceptFromKG.py ../DataMRCombination/outputRLIte$j/forPBR.txt ../DataMRCombination/outputRLIte$j/forPBRVersi2.txt
	python 8.convertNELLToInt.py ../DataMRCombination/outputRLIte$j/forPBRVersi2.txt ../DataMRCombination/outputRLIte$j/NELLInstanceDictionary.txt ../DataMRCombination/outputRLIte$j/NELLRelationDict.txt ../DataMRCombination/outputRLIte$j/_newTriplesinInt.txt
	python 8.PBRversionOptimized.py ../DataMRCombination/outputRLIte$j/_newTriplesinInt.txt ../DataMRCombination/outputRLIte$j/TBOX1inInt ../DataMRCombination/outputRLIte$j/TBOX2inInt ../DataMRCombination/outputRLIte$j/TBOX3inInt ../DataMRCombination/outputRLIte$j/TBOX4inInt ../DataMRCombination/outputRLIte$j/TBOX5inInt ../DataMRCombination/outputRLIte$j/TBOX6inInt ../DataMRCombination/outputRLIte$j/TBOX7inInt ../DataMRCombination/outputRLIte$j/TBOX8inInt ../DataMRCombination/outputRLIte$j/TBOX9inInt ../DataMRCombination/outputRLIte$j/TBOX10inInt ../DataMRCombination/outputRLIte$j/TBOX11inInt ../DataMRCombination/outputRLIte$j/TBOX12inInt  ../DataMRCombination/outputRLIte$j/Instance_Class.txt ../DataMRCombination/outputRLIte$j/NotValid.txt ../DataMRCombination/outputRLIte$j/Unknown.txt	
	python 10.removeDuplicate.py ../DataMRCombination/outputRLIte$j/Unknown.txt ../DataMRCombination/outputRLIte$j/UnknownWD.txt
	python 10.removeDuplicate.py ../DataMRCombination/outputRLIte$j/NotValid.txt ../DataMRCombination/outputRLIte$j/NotValidWD.txt
	python 11.findingOverlap.py ../DataMRCombination/outputRLIte$j/NotValidWD.txt ../DataMRCombination/outputRLIte$j/UnknownWD.txt ../DataMRCombination/outputRLIte$j/OverlapTripleTemp.txt
	python 12.SetOperation.py ../DataMRCombination/outputRLIte$j/UnknownWD.txt ../DataMRCombination/outputRLIte$j/OverlapTripleTemp.txt ../DataMRCombination/outputRLIte$j/unknownWO.txt
	python 13.SetOperationValid.py ../DataMRCombination/outputRLIte$j/_newTriplesinInt.txt ../DataMRCombination/outputRLIte$j/NotValidWD.txt ../DataMRCombination/outputRLIte$j/unknownWO.txt ../DataMRCombination/outputRLIte$j/validTriples.txt
	python 14.translateIntoString.py ../DataMRCombination/outputRLIte$j/validTriples.txt ../DataMRCombination/outputRLIte$j/NELLInstanceDictionary.txt ../DataMRCombination/outputRLIte$j/NELLRelationDict.txt ../DataMRCombination/outputRLIte$j/ValidLabels.txt
	#Valid Labels NELL dalam format instance predicate instance, harus ditambahkan concept name dan :
	#check apakah ada kesamaan antara hasil merge ideal.data.txt di semua RULES worker dengan candidatesForParallel.txt
	python 15.addConceptLabeltoValid.py ../DataMRCombination/outputRLIte$j/ValidLabels.txt ../DataMRCombination/outputRLIte$j/NELLInstClassString.txt ../DataMRCombination/outputRLIte$j/ValidWithConcept.txt 
	python 15.compare.py ../DataMRCombination/outputRLIte$j/mergeInitial.txt ../DataMRCombination/outputRLIte$j/ValidWithConcept.txt ../DataMRCombination/outputRLIte$j/CandidateForTransC.txt
	cd ../DataMRCombination
	k=$((j-1))
	cat NELLKG$k.txt outputRLIte$j/CandidateForTransC.txt > outputRLIte$j/NewForTransC.txt 
	#posisi current directory sekarang di ../../CARRELTransC/ScriptMRCombination
}
