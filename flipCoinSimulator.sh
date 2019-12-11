#!/bin/bash -x

echo "Welcome to FlipCoinSimulator"

declare -A coin
declare -A percentageDict

#SINGLET=1
#DOUBLET=2
#TRIPLET=3
numOfFlipCoin=0

function getRandomFlip(){
   value=$((RANDOM%2))
	echo $value
}

function getFlipCoin(){
   numOfFlip=$numOfFlipCoin
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

function main(){
	echo "Enter How Many Coin You Want To Flip!!!!"
	read flip
	numOfFlipCoin=$flip
	countT=0
	countH=0
	key=1
	for (( i=1;i<=10;i++ ))
	do
		value=$(getFlipCoin)
		coin[$value]=$(( ${coin["$value"]} + 1 ))
	done
}

main

echo "Winning Combination!!!"
for val in ${!coin[@]}
do
	percent=$(( $((${coin[$val]} * 100)) / 10 ))
	echo "$val ${coin[$val]} $percent%"
done | sort -k3 -nr  | awk 'NR==1{print ($1 "   " $2)}'



