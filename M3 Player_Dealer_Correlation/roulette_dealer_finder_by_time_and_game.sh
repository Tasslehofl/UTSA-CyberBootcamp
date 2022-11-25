#!/bin/bash

##  I would name this differently.  It's not just Roulette if you are looking at other games.
##  Named it what I did due to the assignment.

##  First, need to get the information to scan
read -p 'What Date do you want to look at? (Format: MMDD): ' datepath
read -p 'What Time do you want to pull? (Format: HH:MM:SS AM/PM): ' time
read -p 'What Game are you watching? (B-Black Jack, R-Roulette, T-Texas Holdem): ' game

##  Creating the header
echo ' '
echo -e '\033[1m\033[4mDealers by Time and Game\033[0m'
#### Found the information for this formatting at:
#### https://stackoverflow.com/questions/2924697/how-does-one-output-bold-text-in-bash

##  Printing the Date that you are searching
echo 'Date: '"$datepath"
##  Printing the hour and if it's AM or PM that you are looking at
printf "Time: %s %s\n" "$time" #"$ampm"


##  Now, need to get the information from the file
grep "$time" $datepath* |

##  Print out the columns that we need only
##  $1 = Time, #2 = AM/PM, #3 BJ Dealer First Name, #4 BJ Dealer Last Name, #5, Roulette Dealer First Name, #6 Roulette Dealer Last Name, #7 TH Dealer First Name, #8 TH Dealer Last Name 
case $game in
	"B") awk '{print "Game: Blackjack" "\nDealer: " $3, $4}' ;;
	"R") awk '{print "Game: Roulette" "\nDealer: " $5, $6}' ;;
	"T") awk '{print "Game: Texas Holdem" "\nDealer: " $7, $8}' ;;
esac
#### Found the basic information for case at:
#### https://phoenixnap.com/kb/bash-case-statement
#### The /n creates a new line.  It has to be inside the quotes.

echo ' '
