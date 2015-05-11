FROM        ubuntu:14.04.2
MAINTAINER  Justin Menga "justin.menga@gmail.com"
ENV REFRESHED_AT=2015-05-11 FREERADIUS_VERSION=release_3.0.8 FREERADIUS_URL=https://github.com/FreeRADIUS/freeradius-server.git

# FreeRADIUS Dependencies
RUN apt-get update && \
  apt-get install -y openssl ssl-cert libcurl4-gnutls-dev libjson-c-dev libsqlite3-dev libreadline-dev libtalloc-dev libyubikey-dev debhelper quilt autotools-dev libpam0g-dev libmysqlclient-dev libgdbm-dev libsasl2-dev libiodbc2-dev libperl-dev libpcap-dev python-dev libpq-dev libssl-dev git dpkg-dev

# More Dependencies
RUN apt-get install -y libcap-dev libcurl4-openssl-dev libjson0-dev libhiredis-dev libwbclient-dev && \
    mkdir -p /usr/local/src/freeradius

# Download FreeRADIUS
WORKDIR /usr/local/src/freeradius
RUN git clone --depth 1 --branch $FREERADIUS_VERSION $FREERADIUS_URL
WORKDIR /usr/local/src/freeradius/freeradius-server

# Add options
#ENV FREERADIUS_OPTS="--with-experimental-modules --with-jsonc-include-dir=/usr/include/json-c --with-jsonc-lib-dir=/usr/lib/x86_64-linux-gnu --with-redis-include-dir=/usr/include/hiredis --with-redis-lib-dir=/usr/lib/x86_64-linux-gnu"
#RUN sed "s|\(/configure \$(confflags)\)|\1 $FREERADIUS_OPTS |" debian/rules 

ADD rules /usr/local/src/freeradius/freeradius-server/debian/rules 
RUN fakeroot dpkg-buildpackage -b -uc && dpkg -i ../*freeradius*.deb

EXPOSE 1812/udp 1813/udp
CMD ["/usr/sbin/freeradius", "-f"]
