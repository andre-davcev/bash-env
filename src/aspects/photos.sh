#!/bin/bash

# DIRECTORIES
export photos=${documents}/Photos
export archives=/Volumes/MyPassport/Photos/Cathy/Archives

# ALIASES - DIRECTORIES 
aliases photos\
        archives

# ALIASES - SHELLS 
alias c='${shells}/commands/commands.sh'
alias convert='${shells}/convert/convert.sh'
alias extensions='photos; ${shells}/photos/photos.sh'
alias screenshots='${shells}/photos/photos.sh screenshot'
alias skype='${shells}/skype/skype.sh'