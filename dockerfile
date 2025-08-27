FROM jenkins/jenkins:lts

# ติดตั้ง Node.js และ npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs
    