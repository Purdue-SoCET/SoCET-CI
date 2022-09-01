#! /usr/bin/env bash -l

echo "Adding SSH Key..."

echo 'echo $INPUT_SSH_PASSPHRASE' > ~/.ssh_askpass && chmod +x ~/.ssh_askpass

echo "$INPUT_SSH_PRIVATE_KEY" | tr -d '\r' | DISPLAY=None SSH_ASKPASS=~/.ssh_askpass ssh-add - >/dev/null

ssh-add -l # debug SSH Key

echo "Downloading Digital Library..."

fusesoc library add digital-lib git@github.com:Purdue-SoCET/digital-lib.git

echo "Starting FuseSoC Tests..."

targets=$INPUT_FUSESOC_COMMAND

for target in $targets
do
  echo "Running target: $target"
  fusesoc $target
  echo "Target complete: $target"
done

echo "...FuseSoC Tests Complete"
