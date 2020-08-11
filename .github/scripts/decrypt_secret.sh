#!/bin/sh

# Decrypt the file
mkdir $HOME/secrets
# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$LARGE_SECRET_PASSPHRASE" \
--output $HOME/secrets/6c91f3dd95c2217959d38f926b96d7bb_mcuoco12@gmail.com $HOME/.secrets/6c91f3dd95c2217959d38f926b96d7bb_mcuoco12@gmail.com.gpg