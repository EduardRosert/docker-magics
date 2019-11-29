# docker-magics

__Attention__: My Dockerfile was merged to the ECMWF Magics repository at https://github.com/ecmwf/magics, so now an official docker image ``ecmwf/magics`` is available on [dockerhub](https://hub.docker.com/r/ecmwf/magics)! 

__Please use the official image!__
```bash
docker run --rm -i -t ecmwf/magics
```

## Git
[![Git Tag](https://img.shields.io/github/v/tag/eduardrosert/docker-magics)](https://github.com/eduardrosert/docker-magics/releases)
[![License](https://img.shields.io/github/license/eduardrosert/docker-magics)](https://github.com/eduardrosert/docker-magics)
## Docker
[![Docker Automated build](https://img.shields.io/docker/cloud/automated/eduardrosert/magics.svg)](https://hub.docker.com/r/eduardrosert/magics)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/eduardrosert/magics.svg)](https://hub.docker.com/r/eduardrosert/magics)
[![Docker Pulls](https://img.shields.io/docker/pulls/eduardrosert/magics)](https://hub.docker.com/r/eduardrosert/magics)
[![Docker Image Version](https://images.microbadger.com/badges/version/eduardrosert/magics.svg)](https://microbadger.com/images/eduardrosert/magics "Get your own version badge on microbadger.com")
[![Docker Commit Reference](https://images.microbadger.com/badges/commit/eduardrosert/magics.svg)](https://microbadger.com/images/microscaling/microscaling "Get your own commit badge on microbadger.com")

ECMWF [Magics](https://github.com/ecmwf/magics) software, including the [Magics python module](https://pypi.org/project/Magics/) packaged to run in a docker container.

# Run pre-built image with Docker
The pre-built image ``eduardrosert/magics`` is available on [Dockerhub](https://hub.docker.com/r/eduardrosert/magics). If you already have Docker running on your machine, just do the following to run the image.

## Run selfcheck
Run the python module Magics selfcheck:
```bash
docker run --rm  eduardrosert/magics
```
You should see something like this:
```
Found: Magics 'Magics 4.2.0 (64 bit)'.
Your system is ready.
```

## Run interactive shell
Run interactive shell ``/bin/bash`` in docker image ``eduardrosert/magics`` or any other command for that matter overriding the default CMD instruction from the docker image:
```bash
docker run --rm -i -t eduardrosert/magics /bin/bash
```

# Build image manually
You need git, Docker, and make installed on the machine to build the image as follows. 

1. First clone the git repo:
```bash
git clone https://github.com/EduardRosert/docker-magics
```
2. Switch to ``docker-magics`` folder an run:
```bash
make
```
3. Check if image creation was successful:
```bash
docker images
```
You should see the newly created image ``eduardrosert/magics`` with the tag ``latest`` in the list:
```
REPOSITORY                                TAG                 IMAGE ID            CREATED              SIZE
eduardrosert/magics                       latest              9e9d5454675f        About a minute ago   631MB
...
```
