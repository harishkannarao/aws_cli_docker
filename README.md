## Pull latest images and build awscli image

    docker build --pull -t harishkannarao/awscli:latest -f Dockerfile .

## Create local directories
    mkdir ignored

    # To store aws credentials
    mkdir ignored/aws_credentials

    # To store aws keypair
    mkdir ignored/key-pair

    # To store shared files with docker container
    mkdir ignored/shared

## Run aws client as a docker container

    docker run --rm --name aws-cli-latest -it -v `pwd`/ignored/aws_credentials:/root/.aws -v `pwd`/ignored/shared:/shared -v `pwd`/ignored/key-pair:/key-pair harishkannarao/awscli:latest /bin/bash

## Run another terminal attaching to existing container

    docker exec -it aws-cli-latest /bin/bash

## Configure aws cli (oneoff initial setup)

    aws configure

    AWS Access Key ID: {Enter the generated access key}

    AWS Secret Access Key: {Enter the generated secret key}

    Default region name: eu-west-2

    Default output format: json

## List aws configuration (verification of client setup)

    aws configure list

    aws sts get-caller-identity 

## Configure aws cli using environment variable

    docker run --rm --name aws-cli-latest -it --env AWS_ACCESS_KEY_ID={access_key_id} --env AWS_SECRET_ACCESS_KEY={secret_access_key} --env AWS_DEFAULT_REGION=eu-west-2 --env AWS_DEFAULT_OUTPUT=json -v `pwd`/ignored/shared:/shared -v `pwd`/ignored/key-pair:/key-pair harishkannarao/awscli:latest /bin/bash

    aws configure list

    aws sts get-caller-identity 