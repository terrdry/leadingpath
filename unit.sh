#!/usr/bin/env bash


declare -a arr=( "`echo "qq123" | addNumbers.sh`"
                 "`echo "qq" | addNumbers.sh`"
                 "`echo "qq78901" | addNumbers.sh`"
                 "`addNumbers.sh -f test`"
                 "`echo "qq123" | addNumbers.sh -x`"
                 )

declare -a answers=(6 0 25 6 15)

declare -i number=0

for i in "${arr[@]}"
do
    if [ "$i" == "${answers[number]}" ]
    then
        echo "PASSED"
    else
        echo "FAILED; should be "${answers[number]} "got "$i
    fi
    number+=1

done
