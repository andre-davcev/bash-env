#!/bin/bash

# CREATE ALIASES 
aliases()
{ 
    until [[ $# -eq 0 ]]
    do
        name=$1 
        alias_string="cd \"\$${name}\""
        eval alias $name=\'$alias_string\' 
        
        shift
    done
}