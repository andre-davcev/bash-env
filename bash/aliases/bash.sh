#!/bin/bash

# ALIASES - COMMANDS 
alias ll='ls -l'
alias la='ls -lA'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='/usr/bin/vim'
alias grep='grep --color'
alias whence='type -a'

# ALIASES - PROFILE
alias profile='vi "${home}/.profile"'
alias pload='. "${home}/.profile"'

# ALIASES - SHELLS 
alias c='${shells}/commands/commands.sh'
alias convert='${shells}/convert/convert.sh'
