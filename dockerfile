FROM jenkins/jenkins:latest

USER root

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

# Add Docker’s official GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Set up the stable repository for Docker
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
# Install Docker CE
RUN apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io

# Add Jenkins user to the Docker group
RUN usermod -aG docker jenkins | sh

# Set proper permissions for Docker socket
RUN chmod 666 /var/run/docker.sock | sh

# Switch back to Jenkins user
USER jenkins

