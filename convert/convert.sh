#!/bin/bash

# Constants
ARGUMENT_TOTAL=2
ARGUMENT_COUNT=$#

TYPES="unix windows mac"
OS_TYPES=(${TYPES})

# Process command line arguments
scriptname=`echo $0 | sed s/\\\\/.*\\\\///g`
file=$1
from=$2
to=$3
to_file=${file}.${to}

if [[ $ARGUMENT_COUNT -lt $ARGUMENT_TOTAL ]]
then
   echo "Usage:  $scriptname <file> <from_os> <to_os>"
   exit 0
elif [[ ! -f $file ]]
then
    echo "File does not exist:  $file"
    exit 0
elif [[ $from = $to ]]
then
    echo "Operating systems must be different"
    exit 0
elif [[ ! ${OS_TYPES[*]} =~ $from || ! ${OS_TYPES[*]} =~ $to ]]
then
   echo "Valid os types:  ${TYPES}"
   exit 0
fi

if [[ $from  = "unix" && $to = "mac" ]]
then
    tr '\n' '\r' < $file > $to_file
elif [[ $from  = "unix" && $to = "mac" ]]
then
    tr '\r' '\n' < $file > $to_file
fi

echo "File format converted from '$from' to '$to' and saved to '$to_file'"