# Torque Resource Manager
Torque is a resouce manager. Meaning Torque watches over the nodes to provide control over which jobs run on which compute nodes/gpus/resources in the batch queue. Adapative Computing are the main developers of this Open Source product and you can find the download for Torque can be found [here](http://www.adaptivecomputing.com/support/download-center/torque-download/).

I usually prefer to stick to the releases, however, at this time there is a very annoying bug that is only fixed in the 4.2.2 github release. The instructions will cover the building from github first, then after the release of 4.2.2 the guide will also add how to build from the release.

## Pre-build environment
>`$ yum groupinstall "development tools"`
>`$ yum install git imake libtool libxml2-devel openssl-devel`

## Building from source.
>`$ cd ~/Code`  
>`$ git clone https://github.com/adaptivecomputing/torque.git`  
>`$ cd torque`  
>`$ ./autogen.sh`  
>`$ ./configure`  
>`$ make rpm`  
