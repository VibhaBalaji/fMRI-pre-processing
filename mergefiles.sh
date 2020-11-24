#!/bin/bash

for file in *files.txt
do
	(
	address=$(sed '10!d' "$file")
	address=${address:2}
	address=${address:0:-1}
	name=${file:0:-9}
	cd "$name"/$address
	echo "$address"
	fslmerge -t ../../../../"$name"_merge.nii.gz *.nii
	fslmerge -tr ../../../../"$name"_merge.nii.gz ../../../../"$name"_merge.nii.gz 3
	echo "merged in $address"
	cd ../../../..
	)&
done

wait

