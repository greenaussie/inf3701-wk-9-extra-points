#!/bin/bash

# ssh agent passes our ssh private key to other hosts when we ssh to them
# using the -A flag

eval "$(ssh-agent -s)"
ssh-add ssh-private_key.pem