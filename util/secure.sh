#!/bin/bash

option=$1

path=`pwd`

echo
echo "Are you sure you want to zip up all files in:"
echo "    $path?"
echo

read answer

if [[ $answer != "y" ]]
then
    exit 0
fi

directory=`basename $path`

echo

zip -er ${directory}.zip * 

mv ${directory}.zip $downloads

echo "Succesfully zipped folder and sent to $downloads"
