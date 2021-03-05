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

# Install small step client
RUN wget -q "https://github.com/smallstep/cli/releases/download/v0.13.3/step-cli_0.13.3_amd64.deb"
RUN dpkg -i step-cli_0.13.3_amd64.deb

# Install aws session manager plugin
RUN curl -s "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
RUN dpkg -i session-manager-plugin.deb

# Install terraform
RUN curl -s "https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip" -o "terraform.zip"
RUN unzip terraform.zip
RUN mv terraform /usr/local/bin

# Install Graphviz
RUN apt-get install -y graphviz

# Insstall Inframap
RUN curl -L -s "https://github.com/cycloidio/inframap/releases/download/v0.5.2/inframap-linux-amd64.tar.gz" -o "inframap.tar.gz"
RUN tar -xvzf inframap.tar.gz
RUN mv inframap-linux-amd64 /usr/local/bin/inframap

# Install bc
RUN apt-get install -y bc

# Install kubernetes ctl
RUN apt-get install -y apt-transport-https
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl
########################