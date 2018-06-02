#!/bin/bash

BASE_USER=$USER


SHELL='commands.sh'
ARGUMENTS=$#
ARGUMENT_COUNT=1
ASPECT=$1
SUBASPECT=$2
EDIT=$3
IFS=''
TRUE=1
FALSE=0

DIRECTORY_BASE=`echo $0 | sed 's/\/commands\.sh//'`
DIRECTORY_CONFIG=${DIRECTORY_BASE}/config
DIRECTORY_ASPECTS=${DIRECTORY_CONFIG}/aspects
DIRECTORY_HOSTS=${DIRECTORY_CONFIG}/hosts

IS_BASE_TYPE=${FALSE}

OS_TYPE=`uname | tr '[A-Z]' '[a-z]'`
HOST=`hostname`

CONFIG_CHARS=`echo $DIRECTORY_CONFIG | wc -c | tr -d ' '`
CONFIG_CHARS=`expr $CONFIG_CHARS + 1`

if [[ $OS_TYPE == *"cygwin"* ]]
then
    OS_TYPE="linux"
fi

instructions()
{
    echo
    echo "    Usage:  $SHELL <aspect>"
    echo 

    pushd ${DIRECTORY_CONFIG}/unix > /dev/null
    for line in $(ls -1 *.commands | sort)
    do
        NAME=`basename $line | sed 's/\(.*\)\..*/\1/'`
    
        echo ${NAME} | awk '{print "                         "$0}'
    done
    popd > /dev/null
    echo 

    pushd ${DIRECTORY_CONFIG}/aspects > /dev/null
    for line in $(ls -1d * | sort 2> /dev/null)
    do
        NAME=$line
            
        echo ${NAME} | awk '{print "                         "$0}'
    done
    popd > /dev/null

    echo

    exit 0
}

arguments()
{
    FILE_ASPECT=${DIRECTORY_CONFIG}/unix/${ASPECT}.commands
    DIRECTORY_ASPECT=${DIRECTORY_ASPECTS}/${ASPECT}
    FILE_SUBASPECT=${DIRECTORY_ASPECT}/${SUBASPECT}.commands

    ASPECT_LENGTH=`echo $ASPECT | wc -c`

    if [[ -f ${FILE_ASPECT} ]]
    then
        IS_BASE_TYPE=${TRUE}
    elif [[ $SUBASPECT = "create" && ! -d $DIRECTORY_ASPECT ]]
    then
        mkdir $DIRECTORY_ASPECT
        "Created aspect $ASPECT"
        exit 0
    elif [[ -d ${DIRECTORY_ASPECT} && ${ASPECT_LENGTH} -ne 1 ]]
    then
        IS_BASE_TYPE=${FALSE}
    else
        instructions
    fi
}

printCommands()
{
    for line in $(cat $1 | grep '#include')
    do
        FILE_INCLUDE=`echo $line | awk '{print $2}'`

        printCommands ${DIRECTORY_CONFIG}/${FILE_INCLUDE}
    done

    ECHO_ASPECT=`echo $ASPECT | awk '{print toupper(substr($1,1,1)) substr($1,2)}'`
    ECHO_FILE=`echo $1 | cut -c ${CONFIG_CHARS}-`
    
    echo "${ECHO_ASPECT}: (${ECHO_FILE})"
    echo

    for line in $(cat $1 | grep -v '#include')
    do
        echo $line | awk '{print "    "$0}'
    done

    echo
}

process()
{
    echo

    FILE_ASPECT=${ASPECT}.commands

    if [[ ${IS_BASE_TYPE} -eq $TRUE ]]
    then
        FILE_PATH_OS_TYPE=${DIRECTORY_CONFIG}/${OS_TYPE}/${FILE_ASPECT}
        FILE_PATH_HOST=${DIRECTORY_CONFIG}/hosts/${HOST}/${FILE_ASPECT}

        if [[ -f $FILE_PATH_OS_TYPE ]]
        then
            printCommands $FILE_PATH_OS_TYPE
        fi
        
        if [[ -f $FILE_PATH_HOST ]]
        then
            printCommands $FILE_PATH_HOST
        fi
    else
        if [[ -f $FILE_SUBASPECT || $EDIT = "edit" ]]
        then
            ASPECT=$SUBASPECT
           
            if [[ $EDIT = "edit" ]]
            then
               vi $FILE_SUBASPECT
            else 
                printCommands $FILE_SUBASPECT
            fi
        else
            for file in $DIRECTORY_ASPECT/*.commands
            do
                ASPECT=`basename $file | sed 's/\(.*\)\..*/\1/'`
                
                if [[ $SUBASPECT = "list" ]]
                then
                   echo "    $ASPECT"
                else 
                    printCommands $file
                fi
            done
        fi
    fi

    echo
}    

main()
{
    arguments
    process
}

main
