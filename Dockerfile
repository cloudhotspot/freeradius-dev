FROM        ubuntu:14.04.2
MAINTAINER  Justin Menga "justin.menga@gmail.com"
ENV REFRESHED_AT 2015-05-11

# FreeRADIUS Dependencies
RUN apt-get update && \
  apt-get install -y openssl ssl-cert libcurl4-gnutls-dev libjson-c-dev libsqlite3-dev libreadline-dev libtalloc-dev libyubikey-dev debhelper quilt autotools-dev libpam0g-dev libmysqlclient-dev libgdbm-dev libsasl2-dev libiodbc2-dev libperl-dev libpcap-dev python-dev libpq-dev libssl-dev git dpkg-dev

# More Dependencies
RUN apt-get install -y libcap-dev libcurl4-openssl-dev libjson0-dev libhiredis-dev libwbclient-dev && \
    mkdir -p /usr/local/src/freeradius

# Download FreeRADIUS
ENV FREERADIUS_VERSION=release_3.0.8 FREERADIUS_URL=https://github.com/FreeRADIUS/freeradius-server.git FREERADIUS_BRANCH=new
WORKDIR /usr/local/src/freeradius
RUN git clone $FREERADIUS_URL
WORKDIR /usr/local/src/freeradius/freeradius-server
RUN git checkout -b $FREERADIUS_BRANCH $FREERADIUS_VERSION && fakeroot dpkg-buildpackage -b -uc