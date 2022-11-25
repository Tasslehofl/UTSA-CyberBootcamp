#!/bin/bash

##  First, need to get the information to scan
read -p 'Date (Format: MMDD): ' datepath
read -p 'Hour (Format: HH:MM:SS AM/PM): ' time

##  Creating the header
echo ' '
echo -e '\033[1m\033[4mRoulette Dealers by Time\033[0m'
#### Found the information for this formatting at:
#### https://stackoverflow.com/questions/2924697/how-does-one-output-bold-text-in-bash

##  Now, need to get the information from the file
grep "$time" $datepath* |

##  Print out the columns that we need only
awk '{print "Time Dealer was Working: " $1, $2 "\nDealers Name: " $5, $6}' 

echo ' '


# NOTES: found out that the reason I had to keep grepping out the AM/PM was because the 
# $time var (in line 14 on this shell script) was not encased in quotes.  But by doing 
# that, I now force the user to have to enter in the full time (hours, mins, seconds, 
# am/pm) so that it will read the file properly.

