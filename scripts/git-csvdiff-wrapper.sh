#!/bin/bash

if [[ ! -n "$(command -v csvdiff)" ]]; then
    echo "csvdiff not found"
    echo "Please check https://github.com/aswinkarthik/csvdiff"
    exit 1
fi

OLD_FILE=$1
NEW_FILE=$2

echo "Diffing $OLD_FILE and $NEW_FILE"

if [[ "$OLD_FILE" =~ deaths ]]; then
    csvdiff $OLD_FILE $NEW_FILE -p 0,1,2,3,4,5 --ignore-columns 7
elif [[ "$OLD_FILE" =~ covid_states ]]; then
    csvdiff $OLD_FILE $NEW_FILE -p 0,1,2,3 --ignore-columns 11
elif [[ "$OLD_FILE" =~ covid_cities ]]; then
    csvdiff $OLD_FILE $NEW_FILE -p 0,1,2,3,4,5 --ignore-columns 13
elif [[ "$OLD_FILE" =~ covid_states_detailed ]]; then
    csvdiff $OLD_FILE $NEW_FILE -p 0,1,2,3,4 --ignore-columns 11
elif [[ "$OLD_FILE" =~ covid_cities_detailed ]]; then
    csvdiff $OLD_FILE $NEW_FILE -p 0,1,2,3,4,5,6,7 --ignore-columns 15
else
    csvdiff $OLD_FILE $NEW_FILE
fi