function MaterializeOnt {
	i=$1
	#forMate.txt dalam format concept:entity obj_property concept:entity
	mkdir /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination/outputMateIte$i
	python 1.produceABOXinOWLformat.py forMate.txt temp1.txt
	python 2.mergingTBoxWithABox.py temp1.txt ontologyNELLV2020.ttl
	java -jar MaterializeObjProperty.jar ontologyNELLV2020.ttl ResultNELL.ttl
	java -jar ExtractTriples.jar ResultNELL.ttl AfterMat.ttl
	python 3.extractABOXTriplesOnly.py AfterMat.ttl JustNewTriples.txt
	python 5.processReallyNew.py JustNewTriples.txt cleanTriples.txt
	python 5.processforMate.py forMate.txt forMateClean.txt
	python 6.compareBeforeAfter.py forMateClean.txt cleanTriples.txt ReallyNew.txt

	#penambahan concept: disetiap head atau tail entity dilakukan di NELLMRFlow1.sh
	cp forMate.txt /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination/outputMateIte$i
        cp ReallyNew.txt /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination/outputMateIte$i
        cp forMateClean.txt /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination/outputMateIte$i

	rm ontologyNELLV2020.ttl
        rm temp1.txt
        #rm ResultNELL.ttl
        rm AfterMat.ttl
        rm JustNewTriples.txt
        rm NoisyTriples
        rm JustNewTriplesFix.txt
        cp backupNELL.ttl ontologyNELLV2020.ttl


}
