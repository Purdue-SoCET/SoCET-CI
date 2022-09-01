#! /usr/bin/bash -l

# TODO: ADD THIS TO CUSTOM DOCKER CONTAINER START
echo "Adding SSH Key..."

eval $(ssh-agent -s)

echo "passphrase: $INPUT_SSH_PASSPHRASE"
echo "private key: $INPUT_SSH_PRIVATE_KEY"

echo 'echo $INPUT_SSH_PASSPHRASE' > ~/.ssh_askpass && chmod +x ~/.ssh_askpass

echo "$INPUT_SSH_PRIVATE_KEY" | tr -d '\r' | DISPLAY=None SSH_ASKPASS=~/.ssh_askpass ssh-add - >/dev/null

ssh-add -l # debug SSH Key

# TODO: ADD THIS TO CUSTOM DOCKER CONTAINER END

echo "Downloading Digital Library..."

if ! fusesoc library add digital-lib git@github.com:Purdue-SoCET/digital-lib.git ; then
  echo "Failed to fetch digital-lib: ensure that SSH key is added to repository secrets"
  exit 1
fi

echo "Starting FuseSoC Tests..."

targets=$INPUT_TARGETS

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
