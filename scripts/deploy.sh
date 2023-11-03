#!/bin/bash

# Exit on any error
set -e

# Deploy the infrastructure

aws cloudformation deploy \
  --template-file cloudformation-templates/infrastructure.yml \
  --stack-name inf3701-extra-points \
  --capabilities CAPABILITY_IAM

# Save ssh key to file
aws cloudformation describe-stacks \
  --stack-name inf3701-extra-points \
  --query 'Stacks[0].Outputs[?OutputKey==`SSHKey`].OutputValue' \
  --output text > ssh-key.pem


 aws ssm get-parameter --name /ec2/keypair/key-0cdb6bd6ad233274e --with-decryption --query Parameter.Value --output text