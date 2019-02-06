#!/bin/bash

# ALIASES - COMMANDS
alias files='sudo find / -type f -size +50000k -exec ls -lh {} \; > $desktop/large.files.txt 2> /dev/null'