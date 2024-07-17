#!/bin/bash
sed 's/[[:punct:]]/\ / p' $1 | tr '[:upper:]' '[:lower:]' >> temp.txt
declare -A arr
while read line
do
	for word in $line
	do
		if [ -n $arr[$word] ]
		then
			arr[$word]=$((${arr[$word]}+1))
		else
			arr[$word]=0
		fi
	done
done < temp.txt

for key in ${!arr[@]}
do
	echo ${arr[$key]} $key
done

rm temp.txt

