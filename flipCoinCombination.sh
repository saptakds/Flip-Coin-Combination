#!/bin/bash -x
function getFace(){
	if [ $1 -eq 1 ]
	then
		echo "H"
	else
		echo "T"
	fi
}
declare -A combi
flipTimes=21
#Singlet Combinations
H=0
T=0
for i in `seq 1 $flipTimes`
do
	toss=$((1+$RANDOM%2))
	face=$(getFace $toss)
	combi[singlet]="${combi[singlet]} $face"
	if [ $face = "H" ]
	then
		((H++))
	else
		((T--))
	fi
done
probH=$(echo "scale=2;($H/$flipTimes)*100" | bc )
probT=$(echo "scale=2;($T/$flipTimes)*100" | bc )
if [ $H -gt $T ]
then
	echo "Winner: H"
	echo "Percentage: $probH"
else
	echo "Winner: T"
	echo "Percentage: $probT"
fi
