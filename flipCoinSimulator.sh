echo "Welcome to FlipCoinSimulator"

declare -A coin
HEAD=H
TAIL=T
SINGLET=1

function getRandomFlip(){
   value=$((RANDOM%2))
	echo $value
}

function getFlipCoin(){
   numOfFlip=1
   for(( j=1;j<=numOfFlip;j++ ))
   do
      value=$(($(getRandomFlip)))
   done
	echo $value
}

function main(){
	flip=$1
	countT=0
	countH=0
	for (( i=1;i<=10;i++ ))
	do
		value=$(getFlipCoin)
		if [[ $value -eq 0 ]]
		then
			key="H"
			countH=$(($countH+1))
			coin[$key]="T---> $countT"

		else
			key="T"
			countT=$(($countT+1))
			coin[$key]="H---> $countH"

		fi
	done

echo "H=$(($(($countH * 100 ))/10))
echo "T=$(($(($countT * 100 ))/10))
}



main $SINGLET
