#! /usr/bin/bash -l

echo "Adding SSH Key..."

echo 'echo $INPUT_SSH_PASSPHRASE' > ~/.ssh_askpass && chmod +x ~/.ssh_askpass

echo "$INPUT_SSH_PRIVATE_KEY" | tr -d '\r' | DISPLAY=None SSH_ASKPASS=~/.ssh_askpass ssh-add - >/dev/null

ssh-add -l # debug SSH Key

echo "Downloading Digital Library..."

if ![fusesoc library add digital-lib git@github.com:Purdue-SoCET/digital-lib.git]; then
  echo "Failed to fetch digital-lib"
  exit 1
fi

echo "Starting FuseSoC Tests..."

targets=$INPUT_FUSESOC_COMMAND

for target in $targets
do
  echo "Running target: $target"
  if fusesoc $target; then
    echo "Target complete: $target"
  else
    echo "Target failed: $target"
    exit 1
  fi
done

echo "...FuseSoC Tests Complete"
