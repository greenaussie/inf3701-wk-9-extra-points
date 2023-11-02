#!/bin/bash

# Exit on any error
set -e

# Deploy the infrastructure

aws cloudformation deploy \
  --template-file cloudformation-templates/infrastructure.yml \
  --stack-name inf3701-extra-points \
  --capabilities CAPABILITY_IAM
