#!/bin/bash

# Exit on any error
set -e

# Deploy the infrastructure

aws cloudformation delete-stack \
  --stack-name inf3701-extra-points
