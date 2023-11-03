#!/bin/bash

# ssh agent passes our ssh private key to other hosts when we ssh to them
# using the -A flag. We need to ensure only one ssh agent is running.

unset SSH_AGENT_PID
unset SSH_AUTH_SOCK

killall ssh-agent 2>/dev/null || true
eval "$(ssh-agent -s)"
ssh-add -D
ssh-add ssh-private_key.pem

# make sure you run scripts/020-start-ssl-agent-in-cloudshell.sh first to start the ssh agent

BASTION_HOST_PUBLIC_IP=$(aws cloudformation describe-stacks \
  --stack-name inf3701-extra-points \
  --query 'Stacks[0].Outputs[?OutputKey==`BastionHostPublicIp`].OutputValue' \
  --output text)

ssh -A -i ssh-private_key.pem ec2-user@$BASTION_HOST_PUBLIC_IP

