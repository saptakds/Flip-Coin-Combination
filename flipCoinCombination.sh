#!/bin/bash -x
function getFace(){
	if [ $1 -eq 1 ]
	then
		echo "H"
	else
		echo "T"
	fi
}
toss=$((1+$RANDOM%2))
echo `getFace $toss`
