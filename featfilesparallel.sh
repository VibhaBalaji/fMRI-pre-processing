#!/bin/bash

cd runs_output.feat
for file in ../*merge.nii.gz
do
	(
	subid=${file:0:-13}
	subid=${subid:3}
	echo "$subid"
	\cp tmpDesign.fsf temp"$subid".fsf
	sed -i -e 's/subjectid/'${subid}'/' temp"$subid".fsf
	feat temp"$subid".fsf
	rm temp"$subid".fsf
	)&
done


