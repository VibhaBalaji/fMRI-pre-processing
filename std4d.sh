#!/bin/bash

for file in *_merge.nii.gz
do
	(
	subid=${file:0:-13}
	cd "$subid"_output.feat
	echo "$subid"
	flirt -in filtered_func_data.nii.gz -ref reg/standard.nii.gz -out ../"$subid"_std4d.nii.gz -applyxfm -omat "$subid"_matrix.mat
	cd ..
	)&
done	
