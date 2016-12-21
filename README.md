✨ 🐋 MPICH-docker-image 🚢 ✨
=============================

[![layers](https://images.microbadger.com/badges/image/sourceryinstitute/mpich-docker-image.svg)](https://hub.docker.com/r/sourceryinstitute/mpich-docker-image/)
[![commit](https://images.microbadger.com/badges/commit/sourceryinstitute/mpich-docker-image.svg)](https://hub.docker.com/r/sourceryinstitute/mpich-docker-image)
[![Docker Pulls](https://img.shields.io/docker/pulls/sourceryinstitute/mpich-docker-image.svg)](https://hub.docker.com/r/sourceryinstitute/mpich-docker-image/)
[![Maintenance](https://img.shields.io/maintenance/yes/2017.svg)]()
[![GitHub forks](https://img.shields.io/github/forks/sourceryinstitute/mpich-docker-image.svg?style=social&label=Fork)](https://github.com/sourceryinstitute/mpich-docker-image/fork)
[![GitHub stars](https://img.shields.io/github/stars/sourceryinstitute/mpich-docker-image.svg?style=social&label=Star)](https://github.com/sourceryinstitute/mpich-docker-image)
[![GitHub stars](https://img.shields.io/github/watchers/sourceryinstitute/mpich-docker-image.svg?style=social&label=Watch)](https://github.com/sourceryinstitute/mpich-docker-image)
[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?hashtags=docker%2Cbuild%2CGCC%2CMPI&related=docker&text=Lightweight%20docker%20base%20image%20for%20building%20GCC%2C%20MPICH%20and%20OpenCoarrays%21&url=https%3A//github.com/sourceryinstitute/mpich-docker-image&via=zbeekman)

A lightweight
[docker image `FROM sourceryinstitute/docker-base:latest`](https://hub.docker.com/r/sourceryinstitute/docker-base/)
with MPICH installed.

Use this for your own images:
-----------------------------

Your Dockerfile might look like this:

```
FROM sourceryinstitute/mpich-docker-image:latest
COPY . /context
WORKDIR /context
RUN # build your app or apt-get install, etc.
ENTRYPOINT ["/bin/bash","-c"]
CMD ["bin/bash -l"]
#etc
```

See the [Dockerfile reference] and [best practices] for further details.

Then you can build and run with something like:

```
docker build -t my-cool-image .
docker run -it --rm --name my-cool-container my-cool-image
```

Current Packages
----------------

        ca-certificates
        cmake
        curl
        g++
        gcc
        gfortran
        git
        libtool
        make
        mpich
        openssh-client
        sudo
        wget

---

[![GitHub followers](https://img.shields.io/github/followers/sourceryinstitute.svg?style=social&label=Follow)](https://github.com/sourceryinstitute)
[![Twitter Follow](https://img.shields.io/twitter/follow/zbeekman.svg?style=social&label=Follow)](https://twitter.com/intent/follow?screen_name=zbeekman)

[Dockerfile reference]: https://docs.docker.com/engine/reference/builder/
[best practices]: https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/
