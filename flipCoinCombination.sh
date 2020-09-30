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
echo "Singlet Combinations..."
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
#Doublet Combinations
echo "Doublet Combinations..."
HH=0
HT=0
TH=0
TT=0
for j in `seq 1 $flipTimes`
do
    toss1=$((1+$RANDOM%2))
	toss2=$((1+$RANDOM%2))
    face1=$(getFace $toss1)
	face2=$(getFace $toss2)
	face="$face1$face2"
    combi[doublet]="${combi[doublet]} $face"
    if [ $face = "HH" ]
    then
        ((HH++))
	elif [ $face = "HT" ]
	then
		((HT++))
	elif [ $face = "TH" ]
	then
		((TH++))
    else
        ((TT--))
    fi
done
probHH=$(echo "scale=2;($HH/$flipTimes)*100" | bc )
probHT=$(echo "scale=2;($HT/$flipTimes)*100" | bc )
probTH=$(echo "scale=2;($TH/$flipTimes)*100" | bc )
probTT=$(echo "scale=2;($TT/$flipTimes)*100" | bc )
if [ $HH -gt $HT -a $HH -gt $TH -a $HH -gt $TT ]
then
    echo "Winner: HH"
    echo "Percentage: $probHH"
elif [ $HT -gt $HH -a $HT -gt $TH -a $HT -gt $TT ]
then
    echo "Winner: HT"
    echo "Percentage: $probHT"
elif [ $TH -gt $HH -a $TH -gt $HT -a $TH -gt $TT ]
then
    echo "Winner: TH"
    echo "Percentage: $probTH"
else
    echo "Winner: TT"
    echo "Percentage: $probTT"
fi
