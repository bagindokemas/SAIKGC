#asumsi: data NELL sudah > 150k, 
#harus dalam format subject predicate object (dilakukan secara manual)
i=44
while true;
do 
	forNextIter=$(wc -l DataMRCombination/NELLKG$i.txt $1 | cut -d " " -f 1)
	if [ $forNextIter -gt 2500000 ]
        then
           if (($forNextIter%$2500000==0))
                then
                        numPartition=$(($forNextIter/500000))
                else
                        numPartitionX=$(($forNextIter/500000))
                        numPartition=$((numPartitionX+1))

                fi

                if [ $numPartition -ge 10 ]
                then
                        numPartition=10
                fi

        elif [ $forNextIter -lt 5 ]
        then
                break
        elif [ $forNextIter -ge 5 ] && [ $forNextIter -le 2500000 ]
        then
                numPartition=5
        fi
	
	cd DataMRCombination/
        split -da 1 -n r/$numPartition NELLKG$i.txt
	if [ $i -eq 17 ]
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

	#panggil RULES Worker (posisi current direktori di DataMRCombination/
	cd ~/sharedscratch/CARRELFlow2TransC/MapReduceCARREL/RULES/
	
	module load jdk-12.0.1
	$(source ./NELLRULESWorker.sh ; RulesWorker $numPartition)
	module unload jdk-12.0.1
                
	#panggil APR function utk RULES (lokasi file sh di folder RULES)
	i=$((i+1))
	$(source ./NELLAPR2.sh ; APR $numPartition $i)

	# data untuk Materialization dari hasil rules sudah ada di folder MaterializationNELL
	cd ~/sharedscratch/CARRELFlow2TransC/CARRELTransC/	
        module load openjdk-8.0.152
        $(cd MaterializationNELL/ ; source ./materialize.sh ; MaterializeOnt $i)
        module unload openjdk-8.0.152

        if [ ! -f MaterializationNELL/ReallyNew.txt ]
        then
                #next iteration only process output from R and E which is this data ../PrepareDataForWorker/forPBR.txt
                cp /uoa/home/r01krw16/sharedscratch/CARRELFlow2TransC/CARRELTransC/MaterializationNELL/forMateClean.txt DataMRCombination/outputMateIte$i/
                mv DataMRCombination/outputMateIte$i/forMateClean.txt DataMRCombination/outputMateIte$i/CandinputKG$i.txt
        else
                cd MaterializationNELL/
                cat forMateClean.txt ReallyNew.txt > outputMateFix.txt
                cp outputMateFix.txt /uoa/home/r01krw16/sharedscratch/CARRELFlow2TransC/CARRELTransC/DataMRCombination/outputMateIte$i/
                cd /uoa/home/r01krw16/sharedscratch/CARRELFlow2TransC/CARRELTransC/DataMRCombination/outputMateIte$i/
                mv outputMateFix.txt CandinputKG$i.txt
        fi

	cd ~/sharedscratch/CARRELFlow2TransC/CARRELTransC/ReduceStageNELL/
	python 15.addConceptLabeltoValid.py ../DataMRCombination/outputMateIte$i/CandinputKG$i.txt ../TBOXesNELL/NELLInstClassString.txt ../DataMRCombination/outputMateIte$i/NewForTransC.txt
	cd ..
	cp DataMRCombination/outputMateIte$i/NewForTransC.txt PrepareDataForWorker/
	#panggil TransC Worker
	$(source ./TransCWorkerNELL.sh ; TranscWorker $numPartition $i)
	#cek jumlah triples utk next iteration, bila < jumlah partition, break from the loop
	#panggil APR function utk TransC
	$(cd ReduceStageNELL/ ; source ./APRTC-NELL.sh ; APRTC $numPartition $i)
	
	#hasil akhir adalah forMate.txt di PrepareDataForWorker
	cd ~/sharedscratch/CARRELFlow2TransC/CARRELTransC/PrepareDataForWorker/
	cp forMate.txt ../DataMRCombination
	cd ../DataMRCombination
	mv forMate.txt NELLKG$i.txt

	cd ..

	
	cd ..
	if [ $i -eq 60 ]
	then
	    break
	fi

done
