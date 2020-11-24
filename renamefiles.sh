#!/bin/bash

for file in *files.txt
do
	(
	address=$(sed '10!d' "$file")
	address=${address:2}
	address=${address:0:-1}
	cd "${file:0:-9}"/$address
	num=1
	for singlet in *.nii
	do
		mv "$singlet" "$(printf "${file:0:-9}%u" $num).nii"
		let num=$num+1
	done
	cd ../../../..
	)&
done

wait
