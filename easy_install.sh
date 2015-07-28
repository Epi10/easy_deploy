#!/usr/bin/env bash

if [ -z "${REPO}" ]; then
    echo "you must specify a REPO env variable"
    exit 0
fi


GITREPO="github.com/Epi10/${REPO}"
SRCPATH="/usr/local/src/${REPO}"

if [ -z  "${GITKEY}" ]; then

    GITSCHEMA=${GITSCHEMA:-https}

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
    GITURL="${GITSCHEMA}://${git_user}:${git_password}@${GITREPO}"
else
    yum install -y openssh-clients
    mkdir -p /root/.ssh/
    ssh-keyscan github.com 2> /dev/null > /root/.ssh/known_hosts
    cp *rsa /root/.ssh/
    chmod -R 600 /root/.ssh
    GITURL="ssh://git@${GITREPO}"
fi

rm -rf ${SRCPATH}

git clone "${GITURL}" ${SRCPATH}

(cd ${SRCPATH} && sh install.sh)

rm -rf ${SRCPATH}/.git*
rm -rf /root/.ssh
