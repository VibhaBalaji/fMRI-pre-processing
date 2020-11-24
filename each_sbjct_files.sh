#!/bin/bash

for X in *
do
	if [ -d "$X" ] ;then
		cd "$X"
		ls -R > ../"$X"files.txt
		cd ..
fi
done
