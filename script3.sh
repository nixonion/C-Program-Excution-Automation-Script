SOURCE_DIR='lab3'
lab="lab3_out"  
studentsInSection1="stu.txt"
input_para=$(cat test.txt)
if [ -d ./$lab ]
then
	rm -rf $lab
fi
mkdir $lab

echo $input_para
#echo '$input_para'
for userId in $(awk 'NR>=2 {print $(1)}' $studentsInSection1)
do
	echo "------"${userId}"555"
	cd ./$SOURCE_DIR
	tar_file=$(ls *.tar | grep "${userId}")
	cd .. 	
	echo $tar_file	
	if [ ! -z "$tar_file" ]
	then
		echo exist
		if [ ! -d ./$lab/$userId ]
		then
			mkdir ./$lab/$userId
			cp ./$SOURCE_DIR/"$tar_file" ./$lab/$userId/
		fi
		cd ./$lab/$userId/
		tar xvf *.tar
		echo ---
		dir_name=$(ls)
		echo $dir_name
		#cd $dir_name
		#echo ls | grep '.c' 
	
		#cd ..
		cd ..
		cd ..


	fi	
done
pwd
