#!/bin/bash

# assumes AWS_ACCESS_KEY_ID and  AWS_SECRET_ACCESS_KEY are set

export AWS_DEFAULT_REGION=eu-central-1

# have docker login to be able to push to ECR
aws ecr get-login-password | docker login --username AWS --password-stdin 377531193906.dkr.ecr.eu-central-1.amazonaws.com

# build the image
docker build -t beanstalk-example:latest .

# push it to ECR
docker tag beanstalk-example:latest 377531193906.dkr.ecr.eu-central-1.amazonaws.com/beanstalk-example:latest
docker push 377531193906.dkr.ecr.eu-central-1.amazonaws.com/beanstalk-example:latest

