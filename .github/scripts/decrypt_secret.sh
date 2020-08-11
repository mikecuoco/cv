#!/bin/sh

# Decrypt the file
mkdir $HOME/secrets

ENC_TOKEN=$(ls -1 ./.secrets)
#ENC_TOKEN=$(ls -1 ~/cv/.secrets)
DEC_TOKEN=${ENC_TOKEN::${#ENC_TOKEN}-4}

# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$LARGE_SECRET_PASSPHRASE" \
--output $HOME/secrets/$DEC_TOKEN ./.secrets/$ENC_TOKEN