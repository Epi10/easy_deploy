#NTLWS dockerfile

FROM centos:7

MAINTAINER

#IF you use the base imag, you should especify the GITUSER and the GITPASSWORD
# if you are using a already created image
ENV GITUSER= GITPASSWORD= REPO=

RUN sh <(curl https://raw.githubusercontent.com/Epi10/easy_deploy/master/easy_install.md)


COMMAND ["/bin/bash"]
