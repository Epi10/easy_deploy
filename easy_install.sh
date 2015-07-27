#!/usr/bin/env bash

if [ -z "${REPO}" ]; then
    echo "you must specify a REPO env variable"
    exit 0
fi

GITSCHEMA=${GITSCHEMA-https}
GITREPO="github.com/Epi10/${REPO}"
SRCPATH="/usr/local/src/${REPO}"

if [ -z "${GITUSER}" ]; then
    echo -n "ingrese su usuario github: "
    read git_user
else
    git_user=${GITUSER}
fi

if [ -z "${GITPASSWORD}" ]; then
    echo -n "ingrese su password github: "
    read -s git_password
    echo
else
    git_password=${GITPASSWORD}
fi

rm -rf ${SRCPATH}

git clone "${GITSCHEMA}://${git_user}:${git_password}@${GITREPO}" ${SRCPATH}

(cd ${SRCPATH} && sh install.sh)
