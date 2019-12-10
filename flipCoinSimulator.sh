#!/bin/bash -x
echo "Welcome to FlipCoinSimulator"

declare -A coin
declare -A percentageDict
HEAD=H
TAIL=T
SINGLET=1
DOUBLET=2

function getRandomFlip(){
   value=$((RANDOM%2))
	echo $value
}

function getFlipCoin(){
   numOfFlip=$DOUBLET
	key=""
   for(( j=1;j<=numOfFlip;j++ ))
   do
	value=$(($(getRandomFlip)))
	if [[ $value -eq 0 ]]
	then
		key="$key""H"
	else
		key="$key""T"
	fi
   done
echo $key
}

function getpercentage(){
	p=$1
	value=$2
	percent=$(($(($p*100))/10))
	percentageDict[$value]=$percent
}

function main(){
	flip=$1
	countT=0
	countH=0
	key=1
	for (( i=1;i<=10;i++ ))
	do
		value=$(getFlipCoin)
#		echo "value-->$value"
		coin[$value]=$(( ${coin["$value"]} + 1 ))
#		echo ${coin[$value]}
		percentage=$(getpercentage ${coin[$value]} $value)

	done


}

main $DOUBLET

for val in ${!coin[@]}
do
	percent=$(( $((${coin[$val]} * 100)) / 10 ))
	echo "$val ${coin[$val]} $percent%"
done  
