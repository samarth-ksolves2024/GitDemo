#!/bin/bash
read -p "Enter Directory Name: " dir_path
path=$(pwd)
folders=("csv" "txt" "jpg" "jpeg" "mp3" "png" "sh" "others")

for dir in ${folders[@]}
do
	if ! test -e $dir
	then
		mkdir $dir
	fi
done
cd "$dir_path"

for file in $(ls)
do
	if [[ $file =~ .*\.txt ]]
	then
		mv $file "$path/txt/"$file
	elif [[ $file =~ .*\.csv ]]
	then
		mv $file "$path/csv/"$file
	elif [[ $file =~ .*\.mp3 ]]
	then
		mv $file ".$path/mp3/"$file
	elif [[ $file =~ .*\.sh ]]
	then
		mv $file "$path/sh/"$file
	elif [[ $file =~ .*\.png ]]
	then
		mv $file "$path/png/"$file
	elif [[ $file =~ .*\.jpg ]]
	then
		mv $file "$path/jpg/"$file
	elif [[ $file =~ .*\.jpeg ]]
	then
		mv $file "$path/jpeg/"$file
	else
		mv $file "$path/others/"$file
	fi
done
