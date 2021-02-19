# usage: sh cal.sh gradebook_71216
SOURCE_DIR='lab3'
lab="lab3_out"  
studentsInSection1="students.txt"
input_para=$(cat test.txt)
[ -d ./$lab ] && rm -r $lab
mkdir $lab

for userId in ` awk '{print $(NF)}' $studentsInSection1 `
do
	echo "${userId}"
	for file in ./$SOURCE_DIR/* 
	do
		result=$(echo $file | grep "${userId}" )
		#echo $file | grep "${userId}"
		#echo $result
		if [ "$result" != "" ]
		then
			cp "$file" ./$lab/
			[ ! -d ./$lab/$userId ] && mkdir ./$lab/$userId
			cp "$file" ./$lab/$userId/
			#echo "$file"
			cd ./$lab/$userId

			for file1 in ./*
			do
				#result=$(echo $file1 | grep ".tar")
				result1=$(echo $file | grep '.tar')
				if [ "$result1" != "" ] 
				then
					#tar xf $result
					#echo $result1
					ls
					mkdir lab_output
					tar xvf *.tar -C lab_output
					<<COMMENT1
					cd lab_output
					getin=$(ls)
					#echo $getin
					cd ./$getin
					pwd
					cfile=$(ls *.c)
					echo "$input_para" > foo.txt
					gcc -o com $cfile -lm >> GccandMake.txt
					echo "--------------------------------" >> GccandMake.txt
					echo "--------------------------------" >> GccandMake.txt
					make
					echo $getin
					search=$(ls | grep 'com')
					echo $search
					if [ $search != ""]
					then
						./com < foo.txt > GccandMake.txt
					fi					
					#types=$(ls | grep 'script')
					#echo "--------------------------------" >> GccandMake.txt
					#echo "--------------------------------" >> GccandMake.txt
					#cat $types >> GccandMake.txt
					

					#./$getin < foo.txt > GccandMake.txt
					
					cd .. 
					cd ..
					COMMENT1
					#tar xvf $result1
					#pwd
					#echo $file1 | grep ".tar"
				fi
			
			done
			cd ../..
			#cd ..
		fi
	#if [[ $result != "" ]]
	#then
	#result=$(echo $file | grep "${userId}")
	#	echo $file | grep "${userId}"
	#fi
	done

	#echo "$userId"
done

