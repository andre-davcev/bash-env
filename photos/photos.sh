#!/bin/bash

option=$1
alternate=$2

echo "Are you sure you want to change photo file extensions?"
read answer

if [[ $answer != "y" ]]
then
    exit 0
fi

if [[ $option = "screenshot" ]]
then
    files=`ls -1tr *.png | awk '{ printf $0 "|" }' | sed s/_/\!/g | sed s/\ /_/g | sed s/\|/\ /g`
    count=1
    countString=
        date=`echo $filename | awk '{print $3}'`

    fileCount=`ls -1 | wc -l | awk '{print $1}'`

    for file in $files
    do
        filename=`echo $file | sed s/_/\ /g | sed s/\!/_/g`
        countString="${count}"

        if [[ $count -lt 10 ]]
        then
            countString="0${count}"
        fi

        if [[ $fileCount -ge 100 && $count -lt 100 ]]
        then
            countString="0${countString}"
        fi

        if [[ $alternate = "true" ]]
        then
            date=`echo $filename | awk '{print $1}'`
        else
            date=`echo $filename | awk '{print $3}'`
        fi

        newFile="${date} - ${countString}.png"

        mv -f "${filename}" "${newFile}" 
        
        count=`expr $count + 1`
    done

else
    files=`ls *.JPG *.JPEG *.GIF *.PNG *.MOV *.AVI *.MP4 *.AAE | awk '{ printf $0 "|" }' | sed s/_/\!/g | sed s/\ /_/g | sed s/\|/\ /g`

    for file in $files
    do
        file=`echo $file | sed s/_/\ /g | sed s/\!/_/g`
        new_file=`echo $file | awk 'BEGIN {FS = "."} {printf "%s.%s", $1, tolower($2)}'`
        mv -f "$file" "$new_file"
    done
fi 
