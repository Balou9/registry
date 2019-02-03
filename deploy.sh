#!/bin/bash

set -e

sam package --template-file template.yaml \
  --output-template-file packaged.yaml --s3-bucket deno.land

sam deploy --template-file packaged.yaml \
  --stack-name denoland4  --capabilities CAPABILITY_IAM

#aws cloudfront create-invalidation --distribution-id E3NZSZMS5TZ0OU \
#  --paths "/x/*"

echo "Manually update lambda https://console.aws.amazon.com/lambda/home?region=us-east-1"
echo "then manually run:  aws cloudfront create-invalidation --distribution-id E3NZSZMS5TZ0OU --paths /x*"
