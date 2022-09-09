echo "Setting up ssh key"

eval $(ssh-agent -s)

echo "passphrase: $SSH_PASSPHRASE"
echo "private key: $SSH_PRIVATE_KEY"

echo 'echo $INPUT_SSH_PASSPHRASE' > ~/.ssh_askpass && chmod +x ~/.ssh_askpass

echo "$SSH_PRIVATE_KEY" | tr -d '\r' | DISPLAY=None SSH_ASKPASS=~/.ssh_askpass ssh-add - >/dev/null

ssh-add -l # debug SSH Key

echo "Downloading Digital Library..."

if ! fusesoc library add digital-lib git@github.com:Purdue-SoCET/digital-lib.git ; then
  echo "Failed to fetch digital-lib: ensure that SSH key is added to repository secrets"
  exit 1
fi

echo "Removing ssh key"

rm -r ~/.ssh
rm ~/.ssh_askpass