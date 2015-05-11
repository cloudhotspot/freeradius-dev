# CloudHotspot FreeRADIUS

 A Docker Container for FreeRADIUS 3.x Development
 
 ## Introduction
 
 This repository contains a Dockerfile that is used to build the following Docker images:
 
 * cloudhotspot/freeradius:3.0.8 - version 3.0.8 with default compilation options
 * cloudhotspot/freeradius:3.0.8-dev - version 3.0.8 with a number of additional extra modules including `rlm_rest` and `rlm_redis` (see below)
 
## Configuring your Own Image

### Version

Modify the following line in the Dockerfile to change the compiled version:

	ENV FREERADIUS_VERSION=release_3.0.8

### Compilation Options

Modify the following line in the Dockerfile to adjust additional compilation options.

No extra options:

	ENV FREERADIUS_OPTS=

Additional modules:

	ENV FREERADIUS_OPTS="--with-experimental-modules --with-jsonc-include-dir=/usr/include/json-c --with-jsonc-lib-dir=/usr/lib/x86_64-linux-gnu --with-redis-include-dir=/usr/include/hiredis --with-redis-lib-dir=/usr/lib/x86_64-linux-gnu"
   