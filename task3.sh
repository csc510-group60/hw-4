#!/bin/bash

# Step 1: Extract passengers from 2nd class who embarked at Southampton.
# Step 2: Replace "male" with "M" and "female" with "F".
# Step 3: Calculate the average age of the filtered passengers.

awk -F, '$3==2 && $NF ~ /^S/ {print $0} {sum += $7} END {print "Average age:", sum / NR}' titanic.csv | sed 's/male,/M,/g' | sed 's/female,/F,/g' 