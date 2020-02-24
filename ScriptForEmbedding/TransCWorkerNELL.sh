function TranscWorker {
	numberPart=$1
	i=$2 
	if [ $numberPart -eq 1 ]
	then
       		$(cd PrepareDataForWorker/ ; sh NELLWorkersDataPrep.sh)
                mv PrepareDataForWorker/triple2idx.txt PrepareDataForWorker/MRInputIte$i.txt
                $(cd TransC-2/KemScriptForTransC/ ; bash -x NELLTransC-2.sh )
        elif [ $numberPart -eq 5 ]
        then
		$(cd PrepareDataForWorker/ ; sh NELL5WorkersDataPrep.sh)
		mv PrepareDataForWorker/triple2idx.txt PrepareDataForWorker/MRInputIte$i.txt
                $(cd TransC-1/KemScriptForTransC/ ; bash -x NELLTransC-1.sh) &
                $(cd TransC-2/KemScriptForTransC/ ; bash -x NELLTransC-2.sh) &
                $(cd TransC-3/KemScriptForTransC/ ; bash -x NELLTransC-3.sh) &
                $(cd TransC-4/KemScriptForTransC/ ; bash -x NELLTransC-4.sh) &
                $(cd TransC-5/KemScriptForTransC/ ; bash -x NELLTransC-5.sh) &
		wait
	elif [ $numberPart -eq 6 ]
        then
		$(cd PrepareDataForWorker/ ; sh NELL6WorkersDataPrep.sh)
                mv PrepareDataForWorker/triple2idx.txt PrepareDataForWorker/MRInputIte$i.txt
                $(cd TransC-1/KemScriptForTransC/ ; sh NELLTransC-1.sh) &
                $(cd TransC-2/KemScriptForTransC/ ; sh NELLTransC-2.sh) &
                $(cd TransC-3/KemScriptForTransC/ ; sh NELLTransC-3.sh) &
                $(cd TransC-4/KemScriptForTransC/ ; sh NELLTransC-4.sh) &
                $(cd TransC-5/KemScriptForTransC/ ; sh NELLTransC-5.sh) &
                $(cd TransC-6/KemScriptForTransC/ ; sh NELLTransC-6.sh) &
                wait
        elif [ $numberPart -eq 7 ]
        then
                $(cd PrepareDataForWorker/ ; sh NELL7WorkersDataPrep.sh)
                mv PrepareDataForWorker/triple2idx.txt PrepareDataForWorker/MRInputIte$i.txt
                $(cd TransC-1/KemScriptForTransC/ ; sh NELLTransC-1.sh) &
                $(cd TransC-2/KemScriptForTransC/ ; sh NELLTransC-2.sh) &
                $(cd TransC-3/KemScriptForTransC/ ; sh NELLTransC-3.sh) &
                $(cd TransC-4/KemScriptForTransC/ ; sh NELLTransC-4.sh) &
                $(cd TransC-5/KemScriptForTransC/ ; sh NELLTransC-5.sh) &
                $(cd TransC-6/KemScriptForTransC/ ; sh NELLTransC-6.sh) &
                $(cd TransC-7/KemScriptForTransC/ ; sh NELLTransC-7.sh) &
		wait
	elif [ $numberPart -eq 8 ]
        then
                $(cd PrepareDataForWorker/ ; sh NELL8WorkersDataPrep.sh)
                mv PrepareDataForWorker/triple2idx.txt PrepareDataForWorker/MRInputIte$i.txt
                $(cd TransC-1/KemScriptForTransC/ ; sh NELLTransC-1.sh) &
                $(cd TransC-2/KemScriptForTransC/ ; sh NELLTransC-2.sh) &
                $(cd TransC-3/KemScriptForTransC/ ; sh NELLTransC-3.sh) &
                $(cd TransC-4/KemScriptForTransC/ ; sh NELLTransC-4.sh) &
                $(cd TransC-5/KemScriptForTransC/ ; sh NELLTransC-5.sh) &
                $(cd TransC-6/KemScriptForTransC/ ; sh NELLTransC-6.sh) &
                $(cd TransC-7/KemScriptForTransC/ ; sh NELLTransC-7.sh) &
		$(cd TransC-8/KemScriptForTransC/ ; sh NELLTransC-8.sh) &
                wait
	fi

	#reduce stage begins here
        #1. checking overlap
        #2. APR dimulai di sini
        #mkdir scriptDBped/outputIte$i

	
}

