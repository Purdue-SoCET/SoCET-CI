#! /bin/bash -l

echo "Setting up ssh key"

KEY_FILE="/run/secrets/SSH_PRIVATE_KEY"
PHRASE_FILE="/run/secrets/SSH_PASSPHRASE"

SSH_PRIVATE_KEY=$(cat $KEY_FILE)

if [ -f $PHRASE_FILE ]; then
    SSH_PASSPHRASE=$(cat $PHRASE_FILE)
fi

echo "passphrase: $SSH_PASSPHRASE"
echo "private key: $SSH_PRIVATE_KEY"

eval $(ssh-agent -s)

echo 'echo $SSH_PASSPHRASE' > ~/.ssh_askpass && chmod +x ~/.ssh_askpass

echo "$SSH_PRIVATE_KEY" | tr -d '\r' | DISPLAY=None SSH_ASKPASS=~/.ssh_askpass ssh-add - >/dev/null

ssh-add -l # debug SSH Key

echo "Downloading riscv-gnu-toolchain"

git clone https://github.com/riscv/riscv-gnu-toolchain

echo "Setting up environment conditions for building"
export PATH=$PATH:/opt/riscv
cd riscv-gnu-toolchain

echo "Building riscv64-unknown-elf-* from toolchain"
./configure --prefix=/opt/riscv --enable-multilib --with-languages=c,c++
# make

echo "Removing riscv-gnu-toolchain directory"
cd ..
rm -rf riscv-gnu-toolchain

echo "Removing ssh key"

rm -r ~/.ssh
rm ~/.ssh_askpass