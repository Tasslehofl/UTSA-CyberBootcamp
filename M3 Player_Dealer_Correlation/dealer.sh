#!/bin/bash

#  First, need to get the information to scan
read -p 'Date (Format: MMDD): ' datepath
read -p 'Hour (Format: HH): ' time
read -p 'AM or PM: ' ampm

#  Now, need to get the information from the file
grep $time $datepath* |

#  Print out the columns that we need only
awk '{print $1, $2, $5, $6}' | 

#  Make sure we get the AM/PM, then append all the information to the file
grep -i $ampm >> Dealers_working_during_losses


# NOTE: Need to find out why it matters when the AM/PM has to come after awk
# I have tried using the full time as a variable, but because the AM/PM is a 
# different set, it doesn't work.  Need to see if there is a way to combine the 
# two (hour and ampm) var's so that perhaps then I don't have to call out 
# ampm in a seperate grep command after the awk?





