SOURCE_DIR='lab'
lab="lab_out"  
studentsInSection1="stu.txt"
input_para=$(cat test.txt)
for userId in $(awk 'NR>=2 {print $(3)}' $studentsInSection1)
do
	
	
	if [ -d ./$lab/$userId ]
	then
		cd ./$lab/$userId
		#pwd
		
		#file_dir=$(ls | grep -v ".c")
		#main_dir=$(find . -name "*.c" -printf %h)
		echo "-----------" $userId
		#cd $main_dir
		pwd
		cfile=$(ls *.c)
		#mfile=$(ls | grep "Makefile")
		#tfile=$(ls | grep "script")
		echo "$input_para" > CS222_Inet.txt
		echo "--------------------------------" > error.txt
		echo "GCC OUT--->"
		
		if [ ! -z "$cfile" ]
		then
			echo Exists
			gcc -o com "$cfile" -lm 2>> error.txt
			if [ ! -z com ]
			then
				echo "--------------------------------" >> error.txt
				timeout 15 ./com < CS222_Inet.txt >> error.txt
				echo exist com	
			fi
			 
			  #echo "--------------------------------" >> error.txt
			  #cat $cfile >> GccandMake.txt	
		fi
		echo "--------------------------------" >> error.txt
		
		make 2>> error.txt
		cd /home/kali/Downloads
		
	fi		
	
done
