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
RUN wget -q "https://dl.smallstep.com/gh-release/cli/gh-release-header/v0.25.2/step-cli_0.25.2_amd64.deb"
RUN dpkg -i step-cli_0.25.2_amd64.deb

# Install aws session manager plugin
RUN curl -s "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
RUN dpkg -i session-manager-plugin.deb

# Install terraform
RUN curl -s "https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip" -o "terraform.zip"
RUN unzip terraform.zip
RUN mv terraform /usr/local/bin

# Install Graphviz
RUN apt-get install -y graphviz

# Install bc
RUN apt-get install -y bc

# Install kubernetes ctl
# Latest version is at https://cdn.dl.k8s.io/release/stable.txt
RUN curl -sLO https://dl.k8s.io/release/v1.29.3/bin/linux/amd64/kubectl
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN kubectl version --client
########################