echo "Setting up ssh key"

KEY_FILE="/run/secrets/SSH_PRIVATE_KEY"
PHRASE_FILE="/run/secrets/SSH_PASSPHRASE"

SSH_PRIVATE_KEY=$(cat $KEY_FILE)

if [ -f $PHRASE_FILE ]; then
    SSH_PASSPHRASE=$(cat $PHRASE_FILE)
fi


echo "passphrase: $SSH_PASSPHRASE"
echo "private key: $SSH_PRIVATE_KEY"