#!/bin/bash
read -p "Enter name of the Directory: " dir_path
cd $dir_path

sum=0
count=0
min_size=2147483647
max_size=-1

for file in $(ls)
do	
	if [ -f $file ]
	then
		si=$(stat --format '%s' $file)
		sum=$(($sum + si))
		count=$(($count + 1))
		if [ $min_size -gt $si ]
		then
			min_size=$(($si))
		fi
		
		if [ $max_size -lt $si ]
		then
			max_size=$(($si))
		fi
	fi
done

read -p "Enter Threshold value: " thres

printf "\n\nFiles having size greater than $thres KB: \n"
if [ -n thres ]
then
	for file in $(ls)
	do
		if [ -f $file ]
		then	
			si=$(stat --format '%s' $file)
			if [ $si -gt $thres ]
			then
				echo $file
			fi
		fi
	done
fi

printf "\n\nPrinting stats of Directory: \n"
echo "Total Size: " $sum
printf "Average Size: %.2f\n" $(echo "$sum / $count" | bc -l)
echo "Largest File Size: " $max_size
echo "Smallest File Size: " $min_size 




