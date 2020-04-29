#! /bin/bash

echo "Enter Stake Amount"
read STAKE

echo "Enter Bet Amount"
read BET

LOSS=0
WIN=1
NUMBER_OF_DAYS=2

maxAmount=$(( $STAKE*50/100 ))
minAmount=-$maxAmount
dailyAmountLeft=$STAKE

echo "Max Amount : "$maxAmount 

function placeBet() {
	local betStatus=$((RANDOM%2))
	if [ $WIN -eq $betStatus ]
	then
		echo $BET
	else
		echo -$BET
	fi
}

function updateAmount(){
	local betAmount="$( placeBet )"
	dailyAmountLeft=$(( $dailyAmountLeft + $betAmount ))
	echo $dailyAmountLeft
}

function dailyBetting(){
	while [[ $dailyAmountLeft -lt $maxAmount && $dailyAmountLeft -gt $minAmount ]]
	do
		dailyAmountLeft="$(updateAmount)"
	done
	echo $dailyAmountLeft
}

win=0
lose=0

function getTotalWinAndLose(){
	if [ $dailyAmountLeft -gt 0 ]
  	then
		win=$(( $win+1 ))
        else
                lose=$(( $lose+1 ))
        fi
}

totalAmount=0

function getLuckeyUnluckeyDay(){
	if [ $totalAmount -gt $previousAmount ]
	then
		luckeyDay=$i
	else
		unluckeyDay=$i
	fi
}

function Betting(){
	for (( i=1; i <=NUMBER_OF_DAYS; i++ ))
	do
		dailyAmountLeft="$( dailyBetting )"
		previousAmount=$totalAmount
		totalAmount=$(( $totalAmount + $dailyAmountLeft ))
		getTotalWinAndLose
		getLuckeyUnluckeyDay
		dailyAmountLeft=0
	echo "Values : " $totalAmount 
	done
	echo "Total Win = "$win
	echo "Total Lose = "$lose
	echo "L : "$luckeyDay
	echo "UL : "$unluckeyDay

}


Betting
while [ $totalAmount -ge $STAKE ]
do
	echo "Press 1 to continue betting : "
	read choice
	if [ $choice -eq 1 ]
	then
		Betting
	else
		echo "Stop Gambling..."
		exit
	fi
done