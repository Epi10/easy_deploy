#Base Dockerfile

FROM centos:7

MAINTAINER epi10.cl

#Choose your repo
ENV REPO 
#ENV REPO ntl_ws

#by default choose GITKEY = true, uncomment this and then specify git username and password
ENV GITKEY true
#ENV GITUSER git
#ENV GITPASSWORD password

ADD https://raw.githubusercontent.com/Epi10/easy_deploy/master/easy_install.sh /usr/local/src/easy_install.sh

# if you add a GITKEY instead of password uncomment this line
ADD id_rsa /root/

RUN yum install -y git openssh-clients
RUN sh /usr/local/src/easy_install.sh
RUN rm -rf /root/.ssh/*
