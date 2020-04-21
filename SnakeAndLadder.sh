#!/bin/bash -x

#CONSTANT
PLAYER_1=0
PLAYER_2=1
No_Play=0
Ladder=1
Snake=2
WINNING_POSITION=100

#VARIABLE
diceCount=0
PlayerPosition=0
playerOnePosition=0
playerTwoPosition=0
turn=0

#player rolling Die
function rollingDie() {
	result=$((RANDOM%6+1))
	((diceCount++))
	echo $result
}

#check player option
function checkOption(){
	option=$((RANDOM%3))
	case $option in
		$No_Play)
					PlayerPosition=$PlayerPosition
					;;
		$Ladder)
					PlayerPosition=$(( $PlayerPosition + $result ))
					;;
		$Snake)
					PlayerPosition=$(( $PlayerPosition - $result ))
					if [ $PlayerPosition -lt 0 ];
					then
							PlayerPosition=0
					fi
					;;
		esac
		getPreviousPosition
}

function getPreviousPosition(){
	if [ $PlayerPosition -gt $WINNING_POSITION ];
	then
			PlayerPosition=$(( $PlayerPosition - $result ))
	fi
}

function playerTwo(){
	PlayerPosition=$playerTwoPosition
	rollingDie
	checkOption
	playerTwoPosition=$PlayerPosition
	turn=0
	getWinningPlayer
}

function playerOne(){
	PlayerPosition=$playerOnePosition
	rollingDie
	checkOption
	playerOnePosition=$PlayerPosition
	turn=1
	getWinningPlayer
}

function turnPlayer() {
	if [ $turn -eq 0 ]
	then
			playerOne
	else
			playerTwo
	fi
}

function getWinningPlayer () {
	if [ $playerOnePosition -eq $WINNING_POSITION ];
	then
			echo "player One win..."
	elif [ $playerTwoPosition -eq $WINNING_POSITION ];
	then
			echo "player Two Win..."
	fi
}

function startGame(){
	while [ $PlayerPosition != $WINNING_POSITION ]
	do
			turnPlayer
	done
}

#rollinDie
#echo $result
#start playing first player
echo "Player Position: " $PlayerPosition
checkOption
echo "Player Position: " $PlayerPosition
#Two Player Game
startGame
echo "Total Dice Roll: " $diceCount
