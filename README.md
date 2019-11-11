## Pull latest images and build awscli image

    docker build --pull -t harishkannarao/awscli:latest -f Dockerfile .

## Create local directories

    # To store aws credentials
    mkdir aws_credentials

    # To store aws keypair
    mkdir key-pair

    # To store shared files with docker container
    mkdir shared

## Run aws client as a docker container

    docker run --rm -it -v `pwd`/aws_credentials:/root/.aws -v `pwd`/shared:/shared -v `pwd`/key-pair:/key-pair harishkannarao/awscli:latest /bin/bash

## Configure aws cli (oneoff initial setup)

    aws configure

    AWS Access Key ID: {Enter the generated access key}

    AWS Secret Access Key: {Enter the generated secret key}

    Default region name: eu-west-2

    Default output format: json

## List aws configuration (verification of client setup)

    aws configure list

    aws sts get-caller-identity 