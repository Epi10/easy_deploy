#NTLWS dockerfile

FROM centos:7

MAINTAINER epi10.cl

#IF you use the base imag, you should especify the GITUSER and the GITPASSWORD
# if you are using a already created image
ENV GITUSER= GITPASSWORD= REPO=

ADD https://raw.githubusercontent.com/Epi10/easy_deploy/master/easy_install.sh /usr/local/src/easy_install.sh
#    ADD GIT KEY instead of password
# COPY git_key.key /root/.ssh/id_rsa

RUN yum install -y git
RUN GITUSER= GITPASSWORD= REPO=sh /usr/local/src/easy_install.sh

COMMAND ["/bin/bash"]
