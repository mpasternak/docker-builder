FROM ubuntu:16.04

LABEL "com.example.vendor"="iplweb.pl"
LABEL version="0.1"
LABEL description="Ubuntu 16.04 box for building Django sites. Includes PostgreSQL client, Yarn and Node 6"
LABEL maintainer "michal.dtz@gmail.com"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    python-dev \
    python3-dev \
    python-pip \
    python3-pip \
    libssl-dev \
    libffi-dev \
    apt-transport-https \
    postgresql-client \
    zip \
    curl \
    git \
    vim \
    jed \
    emacs24-nox

# Yarn repo and key                                                                              
RUN apt-get install curl
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -                            
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list                                                                                                 
# NodeJS 6 repo and key                                                                          
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
# Install NodeJS and yarn
RUN apt-get update && apt-get install -y yarn nodejs

                                                                                       
# Install bower and grunt-cli via yarn                                                           
RUN yarn global add bower grunt-cli          

# Upgrade pip, install tox
RUN pip install -U pip tox
RUN pip3 install -U pip tox
