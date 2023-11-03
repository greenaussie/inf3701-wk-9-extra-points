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

# obtain the keypair id from the cloudformation stack
export KEYPAIR_ID=$(aws cloudformation describe-stacks \
  --stack-name inf3701-extra-points \
  --query 'Stacks[0].Outputs[?OutputKey==`WorkloadKeyPairId`].OutputValue' \
  --output text)

# write the private key to a file
aws ssm get-parameter --name /ec2/keypair/$KEYPAIR_ID --with-decryption --query Parameter.Value --output text > ssh-private_key.pem
chmod 0600 ssh-private_key.pem