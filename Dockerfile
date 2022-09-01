# Same as Purdue ECN Servers
FROM centos:centos7.9.2009

RUN yum install python3 -y
RUN pip3 install fusesoc
RUN fusesoc library add digital-lib git@github.com:Purdue-SoCET/digital-lib.git

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]