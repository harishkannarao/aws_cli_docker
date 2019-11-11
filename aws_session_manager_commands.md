# AWS Session Management and remote command execution:

## Execute commands on remote EC2 instance

    aws ssm start-session --target {ec2-instance-id}

    # sample command
    ps -Aef

    # quit and terminate the session
    exit

## List active sessions

    aws ssm describe-sessions --state Active

## Terminate an active session

    aws ssm terminate-session --session-id {session-id}

## List terminated sessions

    aws ssm describe-sessions --state History

## Setup port forwarding to EC2 instance

    aws ssm start-session --target {ec2-instance-id} --document-name AWS-StartPortForwardingSession --parameters '{"portNumber":["80"],"localPortNumber":["56789"]}'

## SSH to EC2 instance using key pair

    ssh -4 -o ProxyCommand="aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters 'portNumber=%p'" -i {aws-key-pair.pem}ec2-user@{instance-id}

## SCP to EC2 instance using key pair

    scp -o ProxyCommand="aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters 'portNumber=%p'" -i {aws-key-pair.pem} /path/SampleFile.txt ec2-user@{instance-id}:~