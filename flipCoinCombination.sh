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
		((T++))
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
        ((TT++))
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
#Triplet Combinations
echo "Triplet Combinations..."
HHH=0
HHT=0
HTH=0
HTT=0
THH=0
THT=0
TTH=0
TTT=0
for j in `seq 1 $flipTimes`
do
    toss1=$((1+$RANDOM%2))
    toss2=$((1+$RANDOM%2))
	toss3=$((1+$RANDOM%2))
    face1=$(getFace $toss1)
    face2=$(getFace $toss2)
	face3=$(getFace $toss3)
    face="$face1$face2$face3"
    combi[doublet]="${combi[doublet]} $face"
    if [ $face = "HHH" ]
    then
        ((HHH++))
    elif [ $face = "HHT" ]
    then
        ((HHT++))
    elif [ $face = "HTH" ]
    then
        ((HTH++))
    elif [ $face = "HTT" ]
	then
        ((HTT++))
	elif [ $face = "THH" ]
    then
        ((THH++))
    elif [ $face = "THT" ]
    then
        ((THT++))
    elif [ $face = "TTH" ]
    then
        ((TTH++))
	else
		((TTT++))
    fi
done
probHHH=$(echo "scale=2;($HHH/$flipTimes)*100" | bc )
probHHT=$(echo "scale=2;($HHT/$flipTimes)*100" | bc )
probHTH=$(echo "scale=2;($HTH/$flipTimes)*100" | bc )
probHTT=$(echo "scale=2;($HTT/$flipTimes)*100" | bc )
probTHH=$(echo "scale=2;($THH/$flipTimes)*100" | bc )
probTHT=$(echo "scale=2;($THT/$flipTimes)*100" | bc )
probTTH=$(echo "scale=2;($TTH/$flipTimes)*100" | bc )
probTTT=$(echo "scale=2;($TTT/$flipTimes)*100" | bc )
if [ $HHH -gt $HHT -a $HHH -gt $HTH -a $HHH -gt $HTT -a $HHH -gt $THH -a $HHH -gt $THT -a $HHH -gt $TTH -a $HHH -gt $TTT ]
then
    echo "Winner: HHH"
    echo "Percentage: $probHHH"
elif [ $HHT -gt $HHH -a $HHT -gt $HTH -a $HHT -gt $HTT -a $HHT -gt $THH -a $HHT -gt $THT -a $HHT -gt $TTH -a $HHT -gt $TTT ]
then
    echo "Winner: HHT"
    echo "Percentage: $probHHT"
elif [ $HTH -gt $HHH -a $HTH -gt $HHT -a $HTH -gt $HTT -a $HTH -gt $THH -a $HTH -gt $THT -a $HTH -gt $TTH -a $HTH -gt $TTT ]
then
    echo "Winner: HHT"
    echo "Percentage: $probHHT"
elif [ $HTT -gt $HHH -a $HTT -gt $HHT -a $HTT -gt $HTH -a $HTT -gt $THH -a $HTT -gt $THT -a $HTT -gt $TTH -a $HTT -gt $TTT ]
then
    echo "Winner: HTT"
    echo "Percentage: $probHTT"
elif [ $THH -gt $HHT -a $THH -gt $HTH -a $THH -gt $HTT -a $THH -gt $HHH -a $THH -gt $THT -a $THH -gt $TTH -a $THH -gt $TTT ]
then
    echo "Winner: THH"
    echo "Percentage: $probTHH"
elif [ $THT -gt $HHH -a $THT -gt $HTH -a $THT -gt $HTT -a $THT -gt $THH -a $THT -gt $HHT -a $THT -gt $TTH -a $THT -gt $TTT ]
then
    echo "Winner: THT"
    echo "Percentage: $probTHT"
elif [ $TTH -gt $HHH -a $TTH -gt $HHT -a $TTH -gt $HTT -a $TTH -gt $THH -a $TTH -gt $THT -a $TTH -gt $HTH -a $TTH -gt $TTT ]
then
    echo "Winner: THT"
    echo "Percentage: $probTHT"
else
    echo "Winner: TTT"
    echo "Percentage: $probTTT"
fi
