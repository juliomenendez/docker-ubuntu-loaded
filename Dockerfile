FROM ubuntu:14.04

MAINTAINER Julio Menendez <hello@juliomenendez.com>

# Ignore APT warnings about not having a TTY
ENV DEBIAN_FRONTEND noninteractive

# Ensure UTF-8 locale
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    wget \
    build-essential \
    libcurl4-openssl-dev \
    libffi-dev \
    libgdbm-dev \
    libpq-dev \
    libreadline6-dev \
    libssl-dev \
    libtool \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    zlib1g-dev \
    libsqlite3-dev \
    libfontconfig1-dev \
    libicu-dev \
    libfreetype6 \
    libpng-dev \
    libjpeg-dev \
    libX11-dev \
    libxext-dev \
    g++ \
    flex \
    bison \
    gperf \
    perl \
    make \
    git \
    python3.4 \
    python3-dev \
    python3-pip \
    python-virtualenv
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y \
    nodejs
RUN npm install -g npm && \
    npm install -g grunt-cli bower phantomjs
RUN curl -O http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz && \
    tar -zxvf ruby-2.2.2.tar.gz && \
    cd ruby-2.2.2 && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -r ruby-2.2.2 ruby-2.2.2.tar.gz && \
    echo 'gem: --no-document' > /usr/local/etc/gemrc
