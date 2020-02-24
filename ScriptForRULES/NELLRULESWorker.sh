function RulesWorker {
	numberPart=$1
	if [ $numberPart -eq 1 ]
	then
		$(cd RULES2/ ; sh RULES2NELL.sh) 
	elif [ $numberPart -eq 5 ]
	then
		$(cd RULES1/ ; sh RULES1NELL.sh) &
		$(cd RULES2/ ; sh RULES2NELL.sh) &
		$(cd RULES3/ ; sh RULES3NELL.sh) &
		$(cd RULES4/ ; sh RULES4NELL.sh) &
		$(cd RULES5/ ; sh RULES5NELL.sh) &
		wait
	elif [ $numberPart -eq 6 ]
	then
		$(cd RULES1/ ; sh RULES1NELL.sh) &
                $(cd RULES2/ ; sh RULES2NELL.sh) &
                $(cd RULES3/ ; sh RULES3NELL.sh) &
                $(cd RULES4/ ; sh RULES4NELL.sh) &
                $(cd RULES5/ ; sh RULES5NELL.sh) &
		$(cd RULES6/ ; sh RULES6NELL.sh) &
		wait
	elif [ $numberPart -eq 7 ]
	then
		$(cd RULES1/ ; sh RULES1NELL.sh) &
                $(cd RULES2/ ; sh RULES2NELL.sh) &
                $(cd RULES3/ ; sh RULES3NELL.sh) &
                $(cd RULES4/ ; sh RULES4NELL.sh) &
                $(cd RULES5/ ; sh RULES5NELL.sh) &
                $(cd RULES6/ ; sh RULES6NELL.sh) &
		$(cd RULES7/ ; sh RULES7NELL.sh) &
		wait
	elif [ $numberPart -eq 8 ]
	then
		$(cd RULES1/ ; sh RULES1NELL.sh) &
                $(cd RULES2/ ; sh RULES2NELL.sh) &
                $(cd RULES3/ ; sh RULES3NELL.sh) &
                $(cd RULES4/ ; sh RULES4NELL.sh) &
                $(cd RULES5/ ; sh RULES5NELL.sh) &
                $(cd RULES6/ ; sh RULES6NELL.sh) &
                $(cd RULES7/ ; sh RULES7NELL.sh) &
		$(cd RULES8/ ; sh RULES8NELL.sh) &	
                wait
	elif [ $numberPart -eq 9 ]
	then
		$(cd RULES1/ ; sh RULES1NELL.sh) &
                $(cd RULES2/ ; sh RULES2NELL.sh) &
                $(cd RULES3/ ; sh RULES3NELL.sh) &
                $(cd RULES4/ ; sh RULES4NELL.sh) &
                $(cd RULES5/ ; sh RULES5NELL.sh) &
                $(cd RULES6/ ; sh RULES6NELL.sh) &
                $(cd RULES7/ ; sh RULES7NELL.sh) &
                $(cd RULES8/ ; sh RULES8NELL.sh) &
		$(cd RULES9/ ; sh RULES9NELL.sh) & 
               wait
	elif [ $numberPart -eq 10 ]
	then
		$(cd RULES1/ ; sh RULES1NELL.sh) &
                $(cd RULES2/ ; sh RULES2NELL.sh) &
                $(cd RULES3/ ; sh RULES3NELL.sh) &
                $(cd RULES4/ ; sh RULES4NELL.sh) &
                $(cd RULES5/ ; sh RULES5NELL.sh) &
                $(cd RULES6/ ; sh RULES6NELL.sh) &
                $(cd RULES7/ ; sh RULES7NELL.sh) &
                $(cd RULES8/ ; sh RULES8NELL.sh) &
                $(cd RULES9/ ; sh RULES9NELL.sh) &
		$(cd RULES10/ ; sh RULES10NELL.sh) &   
		wait
	fi 		
}
