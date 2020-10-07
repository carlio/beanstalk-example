#!/bin/bash

# assumes AWS_ACCESS_KEY_ID and  AWS_SECRET_ACCESS_KEY are set

export AWS_DEFAULT_REGION=eu-central-1

# create the ECR repository for uploading docker files
aws ecr create-repository \
    --repository-name beanstalk-example \
    --image-scanning-configuration scanOnPush=true

# create an instance profile that will allow the beanstalk environment to access ECR
# with AmazonEC2ContainerRegistryReadOnly
aws iam create-instance-profile --instance-profile-name beanstalk-example \
    --cli-input-json $(cat instance-profile.json)


aws elasticbeanstalk create-application \
    --application-name beanstalk-example

aws elasticbeanstalk create-environment \
    --application-name beanstalk-example \
    --environment-name example-env \
    --cname-prefix beanstalk-example \
    --solution-stack-name "64bit Amazon Linux 2 v3.1.2 running Docker" \
    --option-settings "Namespace=aws:autoscaling:launchconfiguration,OptionName=IamInstanceProfile,Value=aws-elasticbeanstalk-ec2-role"
