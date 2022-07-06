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
RUN curl -s "https://releases.hashicorp.com/terraform/1.2.3/terraform_1.2.3_linux_amd64.zip" -o "terraform.zip"
RUN unzip terraform.zip
RUN mv terraform /usr/local/bin

# Install Graphviz
RUN apt-get install -y graphviz

# Install bc
RUN apt-get install -y bc

# Install kubernetes ctl
RUN apt-get install -y apt-transport-https
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl
########################