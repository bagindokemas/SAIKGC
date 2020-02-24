#karena dataset Consistent Initial NELL KG sangat kecil (28,453 triples), maka kita menggunakan 1 worker dulu
#1 worker sampai data NELL KG bertumbuh ke 200k triples
#code NELLFlowMR3.sh
#harus dalam format subject predicate object (dilakukan secara manual)
i=56
while true;
do
	# data untuk Materialization ada di cp DataMRCombination/NELLKG$i.tx
	cp DataMRCombination/NELLKG$i.txt MaterializationNELL/
	mv MaterializationNELL/NELLKG$i.txt MaterializationNELL/forMate.txt 
	i=$((i+1))
	module load openjdk-8.0.152
	$(cd MaterializationNELL/ ; source ./materialize.sh ; MaterializeOnt $i)
	module unload openjdk-8.0.152

	if [ ! -f MaterializationNELL/ReallyNew.txt ]
	then
        	#next iteration only process output from R and E which is this data ../PrepareDataForWorker/forPBR.txt
	        cp /uoa/home/r01krw16/sharedscratch/CARRELTransC/MaterializationNELL/forMateClean.txt  DataMRCombination/outputMateIte$i/
        	mv DataMRCombination/outputMateIte$i/forMateClean.txt DataMRCombination/outputMateIte$i/CandinputKG$i.txt
	else
        	cd MaterializationNELL/
	        cat forMateClean.txt ReallyNew.txt > outputMateFix.txt
        	cp outputMateFix.txt /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination/outputMateIte$i/
	        cd /uoa/home/r01krw16/sharedscratch/CARRELTransC/DataMRCombination/outputMateIte$i/
        	mv outputMateFix.txt CandinputKG$i.txt
	fi

	cd ~/sharedscratch/CARRELTransC/
	cp DataMRCombination/outputMateIte$i/CandinputKG$i.txt DataMRCombination/
	python ReduceStageNELL/15.addConceptLabeltoValid.py DataMRCombination/CandinputKG$i.txt TBOXesNELL/NELLInstClassString.txt DataMRCombination/input4Rules$i.txt
	forNextIterss=$(wc -l DataMRCombination/input4Rules$i.txt $1 | cut -d " " -f 1)

        if [ $forNextIterss -gt 2500000 ]
        then
           if (($forNextIterss%$2500000==0))
                then
                        numPartition=$(($forNextIterss/500000))
                else
                        numPartitionX=$(($forNextIterss/500000))
                        numPartition=$((numPartitionX+1))

                fi

                if [ $numPartition -ge 10 ]
                then
                        numPartition=10
                fi

        elif [ $forNextIterss -lt 5 ]
        then
                break
        elif [ $forNextIterss -ge 5 ] && [ $forNextIterss -le 2500000 ]
        then
                numPartition=5
        fi

        cd DataMRCombination/

	split -da 1 -n r/$numPartition input4Rules$i.txt
        if [ $i -eq 37 ]
        then
                cp x0 ../../MapReduceCARREL/RULES/RULES1/data/NELL/
                mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/x0 ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt
                cp x1 ../../MapReduceCARREL/RULES/RULES2/data/NELL/
                mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/x1 ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt
                cp x2 ../../MapReduceCARREL/RULES/RULES3/data/NELL/
                mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/x2 ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt
                cp x3 ../../MapReduceCARREL/RULES/RULES4/data/NELL/
                mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/x3 ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt
                cp x4 ../../MapReduceCARREL/RULES/RULES5/data/NELL/
                mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/x4 ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt
        else
                #siapkan data untuk iterasi berikutnya bagi RULES
                if [ $numPartition -eq 5 ]
                then
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt
                        cp x0 ../../MapReduceCARREL/RULES/RULES1/data/NELL/
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/x0 ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt
                        cp x1 ../../MapReduceCARREL/RULES/RULES2/data/NELL/
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/x1 ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt
                        cp x2 ../../MapReduceCARREL/RULES/RULES3/data/NELL/
                        mv  ../../MapReduceCARREL/RULES/RULES3/data/NELL/x2 ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt
                        cp x3 ../../MapReduceCARREL/RULES/RULES4/data/NELL/
                        mv  ../../MapReduceCARREL/RULES/RULES4/data/NELL/x3 ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt
                        cp x4 ../../MapReduceCARREL/RULES/RULES5/data/NELL/
                        mv  ../../MapReduceCARREL/RULES/RULES5/data/NELL/x4 ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt outputRLIte$i/
                elif [ $numPartition -eq 6 ]
                then
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt
                        cp x0 ../../MapReduceCARREL/RULES/RULES1/data/NELL/
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/x0 ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt
                        cp x1 ../../MapReduceCARREL/RULES/RULES2/data/NELL/
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/x1 ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt
                        cp x2 ../../MapReduceCARREL/RULES/RULES3/data/NELL/
			mv  ../../MapReduceCARREL/RULES/RULES3/data/NELL/x2 ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt
                        cp x3 ../../MapReduceCARREL/RULES/RULES4/data/NELL/
                        mv  ../../MapReduceCARREL/RULES/RULES4/data/NELL/x3 ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt
                        cp x4 ../../MapReduceCARREL/RULES/RULES5/data/NELL/
                        mv  ../../MapReduceCARREL/RULES/RULES5/data/NELL/x4 ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES6/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES5$i.txt
                        cp x5 ../../MapReduceCARREL/RULES/RULES6/data/NELL/
                        mv  ../../MapReduceCARREL/RULES/RULES6/data/NELL/x5 ../../MapReduceCARREL/RULES/RULES6/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt outputRLIte$i/
                elif [ $numPartition -eq 7 ]
                then
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt x0 > ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt x1 > ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt x2 > ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt x3 > ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt x4 > ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES6/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt x5 > ../../MapReduceCARREL/RULES/RULES6/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES7/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES7/data/NELL/InitRULES7$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES7/data/NELL/InitRULES7$i.txt x6 > ../../MapReduceCARREL/RULES/RULES7/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES7/data/NELL/InitRULES7$i.txt outputRLIte$i/
		elif [ $numPartition -eq 8 ]
                then
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt x0 > ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt x1 > ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt x2 > ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt x3 > ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt x4 > ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES6/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt x5 > ../../MapReduceCARREL/RULES/RULES6/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES7/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES7/data/NELL/InitRULES7$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES7/data/NELL/InitRULES7$i.txt x6 > ../../MapReduceCARREL/RULES/RULES7/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES8/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES8/data/NELL/InitRULES8$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES8/data/NELL/InitRULES8$i.txt x7 > ../../MapReduceCARREL/RULES/RULES8/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES7/data/NELL/InitRULES7$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES8/data/NELL/InitRULES8$i.txt outputRLIte$i/
                elif [ $numPartition -eq 9 ]
                then
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt x0 > ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt x1 > ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt x2 > ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt x3 > ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt x4 > ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES6/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt x5 > ../../MapReduceCARREL/RULES/RULES6/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES7/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES7/data/NELL/InitRULES7$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES7/data/NELL/InitRULES7$i.txt x6 > ../../MapReduceCARREL/RULES/RULES7/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES8/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES8/data/NELL/InitRULES8$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES8/data/NELL/InitRULES8$i.txt x7 > ../../MapReduceCARREL/RULES/RULES8/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES9/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES9/data/NELL/InitRULES9$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES9/data/NELL/InitRULES9$i.txt x8 > ../../MapReduceCARREL/RULES/RULES9/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt outputRLIte$i/
			 mv ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES7/data/NELL/InitRULES7$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES8/data/NELL/InitRULES8$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES9/data/NELL/InitRULES9$i.txt outputRLIte$i/
                elif [ $numPartition -eq 10 ]
                then
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt x0 > ../../MapReduceCARREL/RULES/RULES1/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt x1 > ../../MapReduceCARREL/RULES/RULES2/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt x2 > ../../MapReduceCARREL/RULES/RULES3/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt x3 > ../../MapReduceCARREL/RULES/RULES4/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt x4 > ../../MapReduceCARREL/RULES/RULES5/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES6/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt x5 > ../../MapReduceCARREL/RULES/RULES6/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES7/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES7/data/NELL/InitRULES7$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES7/data/NELL/InitRULES7$i.txt x6 > ../../MapReduceCARREL/RULES/RULES7/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES8/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES8/data/NELL/InitRULES8$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES8/data/NELL/InitRULES8$i.txt x7 > ../../MapReduceCARREL/RULES/RULES8/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES9/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES9/data/NELL/InitRULES9$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES9/data/NELL/InitRULES9$i.txt x8 > ../../MapReduceCARREL/RULES/RULES9/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES10/data/NELL/ideal.data.txt ../../MapReduceCARREL/RULES/RULES10/data/NELL/InitRULES10$i.txt
                        cat ../../MapReduceCARREL/RULES/RULES10/data/NELL/InitRULES10$i.txt x9 > ../../MapReduceCARREL/RULES/RULES10/data/NELL/ideal.data.txt
                        mv ../../MapReduceCARREL/RULES/RULES1/data/NELL/InitRULES1$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES2/data/NELL/InitRULES2$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES3/data/NELL/InitRULES3$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES4/data/NELL/InitRULES4$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES5/data/NELL/InitRULES5$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES6/data/NELL/InitRULES6$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES7/data/NELL/InitRULES7$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES8/data/NELL/InitRULES8$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES9/data/NELL/InitRULES9$i.txt outputRLIte$i/
                        mv ../../MapReduceCARREL/RULES/RULES10/data/NELL/InitRULES10$i.txt outputRLIte$i/
                fi
        fi

	cd ~/sharedscratch/CARRELTransC/
	module load jdk-12.0.1
	$(cd ../MapReduceCARREL/RULES/ ; source ./NELLRULESWorker.sh ; RulesWorker $numPartition)
	module unload jdk-12.0.1
                
	#panggil APR function utk RULES (lokasi file sh di folder RULES)
	$(cd ../MapReduceCARREL/RULES/ ; source ./NELLAPR3.sh ; APR $numPartition $i)
	#numCorrect=$(python ../ScriptMRCombination/countLine.py outputRLIte$i/ValidLabels.txt)

	cp DataMRCombination/outputRLIte$i/NewForTransC.txt PrepareDataForWorker/
	#panggil TransC Worker
	$(source ./TransCWorkerNELL.sh ; TranscWorker $numPartition $i)
	#cek jumlah triples utk next iteration, bila < jumlah partition, break from the loop
	#panggil APR function utk TransC
	$(cd ReduceStageNELL/ ; source ./APRTC-NELL.sh ; APRTC $numPartition $i)

	#tambahkan concept: pada hasil materialize 
	cd ~/sharedscratch/CARRELTransC/PrepareDataForWorker
	cp forMate.txt ../DataMRCombination 
	mv ../DataMRCombination/forMate.txt ../DataMRCombination/NELLKG$i.txt 

	cd ..
	if [ $i -eq 70 ]
	then
    		break
	fi
done
