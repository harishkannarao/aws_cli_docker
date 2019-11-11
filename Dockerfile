########################
FROM python:latest

# Install awscli
RUN pip3 install --upgrade awscli

# Install additional packages
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y jq
RUN curl -s "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
RUN dpkg -i session-manager-plugin.deb
########################