
This is an example CI/CD pipeline using a docker image, AWS container registry 
and Elastic Beanstalk to run.

Steps:

1) create an AWS IAM user with the required permissions. For this I just created one 
single user with full access to ECR and to EB but there should be a better security
policy if this is used in a real environment instead of a test/example one. (note
that the IAM user creating the beanstalk applications needs at least 
AmazonEC2ContainerRegistryReadOnly to be able to pull the docker image)

2) install aws-cli, set the correct environment variables for the IAM user
(https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

3) for the first time, create the ECR registry and beanstalk environment,
see `first-creation.sh`. This is a one-time operation.

4) build the docker container - `docker build -t beanstalkexample:latest .`

5) use `docker login` to log in to ECR, then push the image (see `upload-to-ecr.sh`) 

