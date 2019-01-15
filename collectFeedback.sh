#!/bin/bash

SEARCH_STRING=standardUser
FEEDBACK_DATA_PATH="/mnt"
FEEDBACK_DATA_FILE="/tmp/feedback.txt"
DIAGRAM_TITLE="Feedback for Searchstring: $SEARCH_STRING"

CURRENT_DIR=$(pwd)

sudo mount -t nfs4 laus01:/autofeedback /mnt

cd $FEEDBACK_DATA_PATH
echo collecting Data from $FEEDBACK_DATA_PATH


# clear feedback data file
echo "" > $FEEDBACK_DATA_FILE

let counter=0
let negativ_counter=0
# process all files
for file in $(ls);
do
    if [[ ! $file = r???pc?? ]];
    then
        echo "$file does not satisfy pattern rNNNpcNN"
        continue
    fi
    let counter+=1
    # extract room number from filename
    room=${file:1:3}
    # extract pc number from filename
    pc=${file:6:7}
    echo "processing $file -> room: $room -> pc: $pc"
    
    # start your code here
     
    grep $SEARCH_STRING $file
    
    # end your code here
    
    # write return value of last command to $FEEDBACK_DATA_FILE
    value=$?
    let negativ_counter+=$value
    echo "$room $pc $value" >> $FEEDBACK_DATA_FILE
done

cd $CURRENT_DIR

sudo umount /mnt

echo "$counter files processed"
let positiv_counter=$counter-$negativ_counter
echo "$positiv_counter did match search string"
echo "$negativ_counter dit NOT match search string"

echo "$DIAGRAM_TITLE"
gnuplot -persist <<-EOFMarker
    set title "$DIAGRAM_TITLE" font ",16" textcolor rgbcolor "royalblue"
    #set palette gray
    set xrange [0:420]
    set yrange [0:75]
    plot "$FEEDBACK_DATA_FILE" with points palette
EOFMarker
