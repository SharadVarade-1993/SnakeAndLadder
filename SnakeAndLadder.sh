#!/bin/bash -x

#CONSTANT
PLAYER_1=0
No_Play=0
Ladder=1
Snake=2

#VARIABLE
PlayerPosition=0

result=$((RANDOM%6+1))
echo $result

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
				if [ $PlayerPosition -lt 0]
				then
						PlayerPosition=0
				fi
				;;
	esac

