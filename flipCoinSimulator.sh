echo "Welcome to FlipCoinSimulator"
H=0
T=1
coin=$(RANDOM%2)

if [[ $coin -eq 0 ]]
then
	echo "head"
else
	echo "tail"
fi 

