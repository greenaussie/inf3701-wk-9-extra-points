#!/bin/bash

# make sure you run scripts/020-start-ssl-agent-in-cloudshell.sh first to start the ssh agent

BASTION_HOST_PUBLIC_IP=$(aws cloudformation describe-stacks \
  --stack-name inf3701-extra-points \
  --query 'Stacks[0].Outputs[?OutputKey==`BastionHostPublicIp`].OutputValue' \
  --output text)

ssh -A -i ssh-private_key.pem ec2-user@$BASTION_HOST_PUBLIC_IP

