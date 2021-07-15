FROM ubuntu:18.04

LABEL maintainer="austin@songer.pro"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  build-essential \
  git-core \
  subversion \
  vim \
  wget \
  smbclient \
  nfs-common \
  rsh-client \
  whois \
  snmp \
  libreadline-dev \
  libpq5 \
  libpq-dev \
  libreadline5 \
  libsqlite3-dev \
  libpcap-dev \
  autoconf \
  postgresql \
  pgadmin3 \
  curl \
  zlib1g-dev \
  libxml2-dev \
  libxslt1-dev \
  libyaml-dev \
  ssh \
  slurm \
  curl \
  libssl-dev \
  tzdata \
  ruby \
  net-tools \
  ruby-dev && \
  rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt/*

RUN gem install bundler -v '1.17.3'

#Install Metasploit
RUN git clone --depth=1 https://github.com/rapid7/metasploit-framework.git && \
  cd metasploit-framework && \
  bundle install 

WORKDIR /metasploit-framework

CMD ["/metasploit-framework/msfconsole"]
