########################
FROM python:latest

# Install awscli
RUN pip3 install --upgrade awscli

# Update repository
RUN apt-get update

# Install curl
RUN apt-get install -y curl

# Install jq
RUN apt-get install -y jq

# Install aws session manager plugin
RUN curl -s "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
RUN dpkg -i session-manager-plugin.deb
########################