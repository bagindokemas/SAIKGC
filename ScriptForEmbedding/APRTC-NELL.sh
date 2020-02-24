function APRTC {
	#APR untuk hasil dari TransC
	numberPart=$1
	i=$2
	#semua hasil antara dan hasil akhir fungsi ini tarok di folder../../CARRELTran../DataMRCombination/outputTCIte$i
	mkdir /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination/outputTCIte$i
        if [ $numberPart -eq 1 ]
	then
		mv ../TransC-2/src/outputNELL.txt ../TransC-2/src/outWorker2.txt
                mv ../TransC-2/src/outWorker2.txt ../DataMRCombination/outputTCIte$i
		cd ../DataMRCombination/
                mv outputTCIte$i/outWorker2.txt outputTCIte$i/mergeTriples.txt     
	elif [ $numberPart -eq 5 ]
        then
                mv ../TransC-1/src/outputNELL.txt ../TransC-1/src/outWorker1.txt
                mv ../TransC-1/src/outWorker1.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-2/src/outputNELL.txt ../TransC-2/src/outWorker2.txt
                mv ../TransC-2/src/outWorker2.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-3/src/outputNELL.txt ../TransC-3/src/outWorker3.txt
                mv ../TransC-3/src/outWorker3.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-4/src/outputNELL.txt ../TransC-4/src/outWorker4.txt
                mv ../TransC-4/src/outWorker4.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-5/src/outputNELL.txt ../TransC-5/src/outWorker5.txt
                mv ../TransC-5/src/outWorker5.txt ../DataMRCombination/outputTCIte$i/
                cd ../DataMRCombination/
                cat outputTCIte$i/outWorker1.txt outputTCIte$i/outWorker2.txt outputTCIte$i/outWorker3.txt outputTCIte$i/outWorker4.txt outputTCIte$i/outWorker5.txt > outputTCIte$i/mergeTriples.txt                 #check whether the output of all producers really different with the input of all producers.
        elif [ $numberPart -eq 6 ]
        then
		mv ../TransC-1/src/outputNELL.txt ../TransC-1/src/outWorker1.txt
                mv ../TransC-1/src/outWorker1.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-2/src/outputNELL.txt ../TransC-2/src/outWorker2.txt
                mv ../TransC-2/src/outWorker2.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-3/src/outputNELL.txt ../TransC-3/src/outWorker3.txt
                mv ../TransC-3/src/outWorker3.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-4/src/outputNELL.txt ../TransC-4/src/outWorker4.txt
                mv ../TransC-4/src/outWorker4.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-5/src/outputNELL.txt ../TransC-5/src/outWorker5.txt
                mv ../TransC-5/src/outWorker5.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-6/src/outputNELL.txt ../TransC-6/src/outWorker6.txt
                mv ../TransC-6/src/outWorker6.txt ../DataMRCombination/outputTCIte$i/
                cd ../DataMRCombination/
                cat outputTCIte$i/outWorker1.txt outputTCIte$i/outWorker2.txt outputTCIte$i/outWorker3.txt outputTCIte$i/outWorker4.txt outputTCIte$i/outWorker5.txt outputTCIte$i/outWorker6.txt > outputTCIte$i/mergeTriples.txt                 #check whether the output of all producers really different with the input of all producers.
	elif [ $numberPart -eq 7 ]
	then 
		mv ../TransC-1/src/outputNELL.txt ../TransC-1/src/outWorker1.txt
                mv ../TransC-1/src/outWorker1.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-2/src/outputNELL.txt ../TransC-2/src/outWorker2.txt
                mv ../TransC-2/src/outWorker2.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-3/src/outputNELL.txt ../TransC-3/src/outWorker3.txt
                mv ../TransC-3/src/outWorker3.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-4/src/outputNELL.txt ../TransC-4/src/outWorker4.txt
                mv ../TransC-4/src/outWorker4.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-5/src/outputNELL.txt ../TransC-5/src/outWorker5.txt
                mv ../TransC-5/src/outWorker5.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-6/src/outputNELL.txt ../TransC-6/src/outWorker6.txt
                mv ../TransC-6/src/outWorker6.txt ../DataMRCombination/outputTCIte$i/

		mv ../TransC-7/src/outputNELL.txt ../TransC-7/src/outWorker7.txt
                mv ../TransC-7/src/outWorker7.txt ../DataMRCombination/outputTCIte$i/
                cd ../DataMRCombination/
                cat outputTCIte$i/outWorker1.txt outputTCIte$i/outWorker2.txt outputTCIte$i/outWorker3.txt outputTCIte$i/outWorker4.txt outputTCIte$i/outWorker5.txt outputTCIte$i/outWorker6.txt outputTCIte$i/outWorker7.txt > outputTCIte$i/mergeTriples.txt                 #check whether the output of all producers really different with the input of all producers.
	elif [ $numberPart -eq 8 ]
        then
                mv ../TransC-1/src/outputNELL.txt ../TransC-1/src/outWorker1.txt
                mv ../TransC-1/src/outWorker1.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-2/src/outputNELL.txt ../TransC-2/src/outWorker2.txt
                mv ../TransC-2/src/outWorker2.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-3/src/outputNELL.txt ../TransC-3/src/outWorker3.txt
                mv ../TransC-3/src/outWorker3.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-4/src/outputNELL.txt ../TransC-4/src/outWorker4.txt
                mv ../TransC-4/src/outWorker4.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-5/src/outputNELL.txt ../TransC-5/src/outWorker5.txt
                mv ../TransC-5/src/outWorker5.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-6/src/outputNELL.txt ../TransC-6/src/outWorker6.txt
                mv ../TransC-6/src/outWorker6.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-7/src/outputNELL.txt ../TransC-7/src/outWorker7.txt
                mv ../TransC-7/src/outWorker7.txt ../DataMRCombination/outputTCIte$i/

                mv ../TransC-8/src/outputNELL.txt ../TransC-8/src/outWorker8.txt
                mv ../TransC-8/src/outWorker8.txt ../DataMRCombination/outputTCIte$i/
		cd ../DataMRCombination/
                cat outputTCIte$i/outWorker1.txt outputTCIte$i/outWorker2.txt outputTCIte$i/outWorker3.txt outputTCIte$i/outWorker4.txt outputTCIte$i/outWorker5.txt outputTCIte$i/outWorker6.txt outputTCIte$i/outWorker7.txt outputTCIte$i/outWorker8.txt > outputTCIte$i/mergeTriples.txt                 #check whether the output of all producers really different with the input of all producers.
	fi

	#pindah dari folder DataMRCombination/ ke folder ScriptMRCombination/
        cd ../ReduceStageNELL/

	python FixingOutput.py ../DataMRCombination/outputTCIte$i/mergeTriples.txt ../DataMRCombination/outputTCIte$i/mergeTriples3cols.txt #output code ini file sudah dalam format s o p
	#check whether there is duplicate/overlap triples among the outputs
        python 10.removeDuplicate.py ../DataMRCombination/outputTCIte$i/mergeTriples3cols.txt ../DataMRCombination/outputTCIte$i/newTriplesWO.txt
        python 12.SetOperation.py ../DataMRCombination/outputTCIte$i/mergeTriples3cols.txt ../DataMRCombination/outputTCIte$i/newTriplesWO.txt ../DataMRCombination/outputTCIte$i/OverlapTriplesFromMerge.txt
        #check whether the output of all producers really different with the input of all producers.
        python 15.compare.py ../PrepareDataForWorker/MRInputIte$i.txt ../DataMRCombination/outputTCIte$i/newTriplesWO.txt ../DataMRCombination/outputTCIte$i/NewForPBR.txt
        
        #output transC untuk NELL KG masih dalam bentuk integer
        python changeColumnOrder.py ../DataMRCombination/outputTCIte$i/NewForPBR.txt ../DataMRCombination/outputTCIte$i/newTriplesReady.txt

        python 14.translateIntoString.py ../DataMRCombination/outputTCIte$i/newTriplesReady.txt ../PrepareDataForWorker/instanceDict.txt ../PrepareDataForWorker/RelationDict.txt ../DataMRCombination/outputTCIte$i/forPBR.txt
	#tambahkan concept: ke forPBR.txt sblm diproses oleh makeInstanceDictionary
	python 15.addConceptLabeltoValid.py ../DataMRCombination/outputTCIte$i/forPBR.txt ../TBOXesNELL/NELLInstClassString.txt ../DataMRCombination/outputTCIte$i/forPBRWithConcept.txt
        python 2.makeInstanceDictionary.py ../DataMRCombination/outputTCIte$i/forPBRWithConcept.txt ../DataMRCombination/outputTCIte$i/NELLInstanceDictionary.txt
        #list of relation dari lokasi lain
        #hitung dulu berapa baris file instance
        numLineInstance=$(python countLine.py ../DataMRCombination/outputTCIte$i/NELLInstanceDictionary.txt)
        python 3.makeRelationDictionary.py ../DataMRCombination/outputTCIte$i/NELLRelationDict.txt $numLineInstance
        numLineRelation=$(python countLine.py ../DataMRCombination/outputTCIte$i/NELLRelationDict.txt)
        numLineClass=$((numLineInstance+numLineRelation))
        python 4.makeClassDictionary.py ../DataMRCombination/outputTCIte$i/NELLClassDict.txt $numLineClass
        python 5.makeInstanceClassFile.py ../DataMRCombination/outputTCIte$i/forPBRWithConcept.txt ../DataMRCombination/outputTCIte$i/NELLInstClassString.txt
	python 6.makeInstanceClassMapping.py ../DataMRCombination/outputTCIte$i/NELLInstanceDictionary.txt ../DataMRCombination/outputTCIte$i/NELLClassDict.txt ../DataMRCombination/outputTCIte$i/NELLInstClassString.txt ../DataMRCombination/outputTCIte$i/Instance_Class.txt        
	python 9.convertTBOXESintoInt.py ../DataMRCombination/outputTCIte$i/NELLClassDict.txt ../DataMRCombination/outputTCIte$i/NELLRelationDict.txt ../DataMRCombination/outputTCIte$i/TBOX1inInt ../DataMRCombination/outputTCIte$i/TBOX2inInt ../DataMRCombination/outputTCIte$i/TBOX3inInt ../DataMRCombination/outputTCIte$i/TBOX4inInt ../DataMRCombination/outputTCIte$i/TBOX5inInt ../DataMRCombination/outputTCIte$i/TBOX6inInt ../DataMRCombination/outputTCIte$i/TBOX7inInt ../DataMRCombination/outputTCIte$i/TBOX8inInt ../DataMRCombination/outputTCIte$i/TBOX9inInt ../DataMRCombination/outputTCIte$i/TBOX10inInt ../DataMRCombination/outputTCIte$i/TBOX11inInt ../DataMRCombination/outputTCIte$i/TBOX12inInt
	#python 7.removeConceptFromKG.py ../DataMRCombination/outputTCIte$i/forPBR.txt ../DataMRCombination/outputTCIte$i/forPBRVersi2.txt
        python 8.convertNELLToInt.py ../DataMRCombination/outputTCIte$i/forPBR.txt ../DataMRCombination/outputTCIte$i/NELLInstanceDictionary.txt ../DataMRCombination/outputTCIte$i/NELLRelationDict.txt ../DataMRCombination/outputTCIte$i/_newTriplesinInt.txt
        python 8.PBRversionOptimized.py ../DataMRCombination/outputTCIte$i/_newTriplesinInt.txt ../DataMRCombination/outputTCIte$i/TBOX1inInt ../DataMRCombination/outputTCIte$i/TBOX2inInt ../DataMRCombination/outputTCIte$i/TBOX3inInt ../DataMRCombination/outputTCIte$i/TBOX4inInt ../DataMRCombination/outputTCIte$i/TBOX5inInt ../DataMRCombination/outputTCIte$i/TBOX6inInt ../DataMRCombination/outputTCIte$i/TBOX7inInt ../DataMRCombination/outputTCIte$i/TBOX8inInt ../DataMRCombination/outputTCIte$i/TBOX9inInt ../DataMRCombination/outputTCIte$i/TBOX10inInt ../DataMRCombination/outputTCIte$i/TBOX11inInt ../DataMRCombination/outputTCIte$i/TBOX12inInt  ../DataMRCombination/outputTCIte$i/Instance_Class.txt ../DataMRCombination/outputTCIte$i/NotValid.txt ../DataMRCombination/outputTCIte$i/Unknown.txt	
        python 10.removeDuplicate.py ../DataMRCombination/outputTCIte$i/Unknown.txt ../DataMRCombination/outputTCIte$i/UnknownWD.txt
        python 10.removeDuplicate.py ../DataMRCombination/outputTCIte$i/NotValid.txt ../DataMRCombination/outputTCIte$i/NotValidWD.txt
        python 11.findingOverlap.py ../DataMRCombination/outputTCIte$i/NotValidWD.txt ../DataMRCombination/outputTCIte$i/UnknownWD.txt ../DataMRCombination/outputTCIte$i/OverlapTripleTemp.txt
        python 12.SetOperation.py ../DataMRCombination/outputTCIte$i/UnknownWD.txt ../DataMRCombination/outputTCIte$i/OverlapTripleTemp.txt ../DataMRCombination/outputTCIte$i/unknownWO.txt
        python 13.SetOperationValid.py ../DataMRCombination/outputTCIte$i/_newTriplesinInt.txt ../DataMRCombination/outputTCIte$i/NotValidWD.txt ../DataMRCombination/outputTCIte$i/unknownWO.txt ../DataMRCombination/outputTCIte$i/validTriples.txt
        python 14.translateIntoString.py ../DataMRCombination/outputTCIte$i/validTriples.txt ../DataMRCombination/outputTCIte$i/NELLInstanceDictionary.txt ../DataMRCombination/outputTCIte$i/NELLRelationDict.txt ../DataMRCombination/outputTCIte$i/ValidLabels.txt
	#tambahkan concept: ke ValidLabels		
	python 15.addConceptLabeltoValid.py ../DataMRCombination/outputTCIte$i/ValidLabels.txt ../TBOXesNELL/NELLInstClassString.txt ../DataMRCombination/outputTCIte$i/ValidLabelsWithConcept.txt

	cp ../DataMRCombination/outputTCIte$i/ValidLabelsWithConcept.txt ../PrepareDataForWorker/
        cd ../PrepareDataForWorker/
        cat NewForTransC.txt ValidLabelsWithConcept.txt > forMate.txt
        rm ValidLabelsWithConcept.txt
        
	cd ../ReduceStageNELL/
	#forMate.txt sudah dalam format <concept:entity> <object_property> <concept:entity>

}
