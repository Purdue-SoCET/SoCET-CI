# Used for GitHub Action

FROM verilator/verilator:v5.028

RUN apt-get update
RUN apt-get install --no-install-recommends --yes git python3 python3-pip ssh make perl g++ zlib1g-dev
RUN pip3 install fusesoc==2.3 PyYAML argparse
RUN mkdir ~/.ssh
RUN ssh-keyscan github.com >>~/.ssh/known_hosts

# clean build dependencies
RUN apt remove python3-pip -y
RUN apt autoremove -y

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]