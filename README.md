# CloudHotspot FreeRADIUS

 A Docker Container for FreeRADIUS 3.x Development
 
 ## Introduction
 
 This repository contains a Dockerfile that is used to build the FreeRADIUS for development purposes:
 
## Configuring your Own Image

### Version

Modify the following line in the Dockerfile to change the compiled version:

	ENV FREERADIUS_VERSION=release_3.0.8

### Compilation Options

The debian image is built using the `rules` file in the local folder.  The default `rules` file is located at `rules.default`.  

The local `rules` that is applied adds the following development module component flags to the `./configure` action:

	./configure $(confflags) \
		... \
		--with-experimental-modules \
		--with-jsonc-include-dir=/usr/include/json-c \
		--with-jsonc-lib-dir=/usr/lib/x86_64-linux-gnu \
		--with-redis-include-dir=/usr/include/hiredis \
		--with-redis-lib-dir=/usr/lib/x86_64-linux-gnu
   