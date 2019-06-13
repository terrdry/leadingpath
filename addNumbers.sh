#!/bin/bash

if [ $# -eq 2 ] && [ $1 = '-f' ]
then
    # read in the file we specified
    INPUT_LINE=$(<$2)
    #Delete the letters from the numbers
    INPUT_LINE=`echo $INPUT_LINE | tr -d '[:alpha:]'`
    elif [ $# -eq 1 ] && [ $1 = '-x' ]
    then
        read INPUT_LINE
        #Delete the letters from the numbers
        INPUT_LINE=`echo $INPUT_LINE | tr -d '[:alpha:]'`
        INPUT_LINE=`echo $INPUT_LINE | tr -d '\n' | od -t x1 -An `
    else
        read INPUT_LINE
fi

declare -i AGGREGATE=0
#add 'em up
for (( i=0; i<${#INPUT_LINE}; i++)); do
    ADDER="${INPUT_LINE:$i:1}"
    AGGREGATE=$(( AGGREGATE + ADDER ))
done

#display Total
echo $AGGREGATE
