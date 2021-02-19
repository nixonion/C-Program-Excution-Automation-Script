SOURCE_DIR='lab3'
lab="lab3_out"  
studentsInSection1="stu.txt"
input_para=$(cat test.txt)
for userId in $(awk 'NR>=2 {print $(1)}' $studentsInSection1)
do
	
	
	if [ -d ./$lab/$userId ]
	then
		cd ./$lab/$userId
		#pwd
		
		file_dir=$(ls | grep -v ".tar")
		main_dir=$(find . -name "*.c" -printf %h)
		echo "-----------" $userId
		cd $main_dir
		pwd
		cfile=$(ls *.c)
		mfile=$(ls | grep "Makefile")
		tfile=$(ls | grep "script")
		echo "$input_para" > foo.txt
		echo "--------------------------------" > GccandMake.txt
		echo "GCC OUT--->"
		
		if [ ! -z $cfile ]
		then
			echo Exists
			gcc -o com $cfile -lm 2> error.txt
			if [ ! -z com ]
			then
				timeout 15 ./com < foo.txt >> GccandMake.txt
				echo exist com	
			fi
			 
			  echo "--------------------------------" >> GccandMake.txt
			  #cat $cfile >> GccandMake.txt	
		fi
		echo "--------------------------------" >> error.txt
		
		make 2>> error.txt
		cd /home/kali/Downloads
		
	fi		
	
done
