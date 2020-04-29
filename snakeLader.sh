#!/bin/bash 

echo "LET'S START THE GAME"

STARTING_POSITION=0
ENDING_POSITION=100

player_place=$STARTING_POSITION

count=0
flag="true"

echo "Enter the First player name"
read player1

echo "Enter the Second player name"
read player2

echo "player1 "$player1

echo "player2 "$player2

function positionCheck(){
if (( $player_place < $STARTING_POSITION))
then
player_place=0
echo "player at position=" $player_place

elif (( $player_place > $ENDING_POSITION))
then
player_place=$(($player_place-$dice))
echo "player at position="$player_place

else
echo "player at position="$player_place
fi
}

function diceRoll(){
echo "press any key to roll a dice"
read presskey

dice=$((1+RANDOM%6))

echo "dice rolling and you got= "$dice

scenario=$((1+RANDOM%3))

case $scenario in

  1)
echo "stay in same position"
player_place=$player_place

positionCheck
      ;;

  2)
echo "yeah ladder.."
player_place=$(($player_place+$dice))
positionCheck
       ;;

  3)
echo "snake.."
player_place=$(($player_place-$dice))
positionCheck
       ;;

esac

count=$(($count+1))

}


while [[ $flag -eq "true" ]]
do
echo "$player1 turn's"
diceRoll

if (( $player_place == $ENDING_POSITION))
then
echo "Total number of times dice throw to finish the game= "$count
echo "yeah $player1 I won....."
flag="false"
break
fi

echo "$player2 turn's"
diceRoll
if (( $player_place == $ENDING_POSITION))
then
echo "Total number of times dice throw to finish the game= "$count
echo "yeah $player2 I won....."
flag="false"
break
fi

done