#!/bin/bash

# DIRECTORIES
export desktop=${HOME}/Desktop
export documents=${HOME}/Documents
export applications=/Applications
export downloads=${HOME}/Downloads
export projects=${HOME}/Files
export fantasia=${projects}/Fantasia
export shells=${documents}/Bash
export aspects=${shells}/commands/config/aspects
export firefly=${projects}/Firefly
export photos=${documents}/Photos
export archives=/Volumes/MyPassport/Photos/Cathy/Archives

# ALIASES - DIRECTORIES 
aliases desktop\
        documents\
        applications\
        downloads\
        projects\
        shells\
        aspects\
        firefly\
        fantasia\
        photos\
        archives

# ALIASES - COMMANDS
alias files='sudo find / -type f -size +50000k -exec ls -lh {} \; > $desktop/large.files.txt 2> /dev/null'

# ALIASES - BASHRC FILES
alias settings='vi ${shells}/bash/settings/settings.sh'
alias functions='vi ${shells}/bash/functions/functions.sh'
alias exports='vi ${shells}/bash/exports/exports.sh'
alias path='vi ${shells}/bash/path/path.sh'
alias aliases='vi ${shells}/bash/aliases/aliases.sh'
alias bashrc='vi ${shells}/bash/bashrc/bashrc.sh'

# ALIASES - PROFILE
alias profile='vi "$HOME/.profile"'
alias pload='. "$HOME/.profile"'

# ALIASES - SHELLS 
alias c='${shells}/commands/commands.sh'
alias convert='${shells}/convert/convert.sh'
alias extensions='photos; ${shells}/photos/photos.sh'
alias screenshots='${shells}/photos/photos.sh screenshot'
alias skype='${shells}/skype/skype.sh'

# ALIASES - DEVELOPMENT
alias fan-build='cd ${fantasia}/fantasia; npm run build;'
alias fan-watch='cd ${fantasia}/fantasia; npm run watch;'
alias wp-content='cd ${fantasia}/fantasia/build/wp-content/themes/fantasia/dist'
alias npmperms='sudo chown -R $USER ~/.npm'
alias npmls='npm list -g --depth=0'

# ALIASES - FIREFLY
alias fire='cd ${firefly}/app; grunt'
alias fire-design='cd ${firefly}/design; grunt'
alias fire-serve='cd ${firefly}/app; ionic serve'
alias fire-push='cd ${firefly}/app; git push ionic master'
alias fire-library='cd ${firefly}/library; grunt build-watch'
alias fire-core='cd ${firefly}/core; grunt build-watch'

# ALIASES - RANDOM
alias mame='$frameworks/Mame/mame64'

# ALIASES - AWS
export ec2_dns='ec2-52-14-6-194.us-east-2.compute.amazonaws.com'
export ec2_user='ec2-user'
export ec2_connect="${ec2_user}@${ec2_dns}"
export ec2_key_pair="$fantasia/fantasia/documents/key-pairs/admin-key-pair-us-east-ohio.pem"
alias ec2='ssh -i $ec2_key_pair $ec2_connect'
# scp -i $ec2_key_pair <file_path> ${ec2_connect}:<remote_path>
# scp -i $ec2_key_pair ${ec2_connect}:<remote_file_path> <local_to_path>
# /var/www/html
