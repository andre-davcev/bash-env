#!/bin/bash

get_property()
{
    property=$1
    property=`cat ${file_config} | grep "${property}=" | awk 'BEGIN{FS="="}{print $2}'`

    echo $property
}

get_properties()
{
    while read line           
    do
        line=`echo $line | tr -d ' '`
        char_count=`echo $line | wc -c | tr -d ' '`

        if [[ $char_count -gt 1 ]]
        then
            key=`echo $line | awk 'BEGIN{FS="="}{print $1}'`
            value=`echo $line | awk 'BEGIN{FS="="}{print $2}'`

            property_type=`echo $key | awk 'BEGIN{FS="."}{print $1}'`

            if [[ $property_type = "directory" ]]
            then
                value=${directory_base}/${value}
            fi

            property_name=`echo $key | sed 's/\./_/g'`

            eval $property_name=\'${value}\'
        fi
    done < $file_config
}

initialize()
{
    echo 
    script=$0
    basename=`basename $script`
    directory_base=`echo $script | sed "s/\/${basename}//"`

    pushd $directory_base > /dev/null

    directory_base=`pwd`

    popd > /dev/null

    file_config=${directory_base}/config.properties

    get_properties
}

main()
{
    initialize
}

main