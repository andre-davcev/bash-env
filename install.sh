#!/bin/bash
environment=`dirname ${BASH_SOURCE[0]}`

case "$OSTYPE" in
  linux*)   export env='windows';  echo "OS: Linux / WSL" ;;
  darwin*)  export env='mac';      echo "OS: Mac" ;; 
  msys*)    export env='windows';  echo "OS: MSYS / MinGW / Git Bash" ;;
  cygwin*)  export env='cygwin';   echo "OS: Cygwin" ;;
  bsd*)     export env='bsg';      echo "OS: BSD" ;;
  solaris*) export env='solaris';  echo "OS: Solaris" ;;
  *)        export env='unknown';  echo "OS: Unknown" ;;
esac

if [[ -d ${environment} ]]
then
    pushd ${environment} > /dev/null

    source functions/base.sh
    source functions/${env}.sh

    source directories/base.sh
    source directories/${env}.sh

    source exports/base.sh
    source exports/${env}.sh

    source path/base.sh
    source path/${env}.sh

    source settings/base.sh
    source settings/${env}.sh

    source aliases/base.sh
    source aliases/${env}.sh

    source aspects/dev.sh

    popd > /dev/null
fi