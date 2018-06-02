SHELLS_HOME="${HOME}/Files/Fantasia/shells/bash"

if [[ -d "${SHELLS_HOME}" ]]
then
    pushd "${SHELLS_HOME}" > /dev/null

    source "settings/settings.sh"
    source "functions/functions.sh"
    source "exports/exports.sh"
    source "path/path.sh"
    source "aliases/aliases.sh"
    source "bashrc/bashrc.sh"

    popd > /dev/null
fi