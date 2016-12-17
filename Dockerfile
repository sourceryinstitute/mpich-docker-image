FROM sourceryinstitute/docker-base:latest

MAINTAINER Izaak "Zaak" Beekman <contact@izaakbeekman.com>

COPY LICENSE /NOTICE
COPY mpich-3.1.4-SHA256.txt /mpich-3.1.4-SHA256.txt

WORKDIR /

ENV MPI_HOME=/opt/mpich/3.1.4/gnu/6.2.1

RUN  DEBIAN_FRONTEND=noninteractive \
     && pwd \
     && echo "$DEBIAN_FRONTEND" \
     && cat /NOTICE \
     && /bin/bash -c 'wget -q -O - http://www.mpich.org/static/downloads/3.1.4/mpich-3.1.4.tar.gz | tee >(sha256sum -c /mpich-3.1.4-SHA256.txt >&2 ) | tar xzv -C /' \
     && mkdir mpich-3.1.4/build \
     && cd mpich-3.1.4/build \
     && ../configure --prefix="$MPI_HOME" \
     && make -j "$(nproc)" \
     && make install \
     && export PATH="$MPI_HOME/bin:$PATH" \
     && mpirun --version \
     && mpif90 -show \
     && mpif90 --version \
     && make clean \
     && make distclean \
     && cd / \
     && rm -rf /mpich-3.1.4 \
     && mkdir /mpi-tests \
     && cd /mpi-tests \
     && wget https://raw.githubusercontent.com/wesleykendall/mpitutorial/master/tutorials/mpi-hello-world/code/mpi_hello_world.c \
     && mpicc mpi_hello_world.c -o hello-c \
     && mpirun -np 4 ./hello-c \
     && wget https://people.sc.fsu.edu/~jburkardt/f_src/hello_mpi/hello_mpi.f90 \
     && mpif90 hello_mpi.f90 -o HELLO-f90 \
     && mpirun -np 4 ./HELLO-f90 \
     && cd / \
     && rm -rf mpi-tests \
     && rm -rf /var/lib/apt/lists/* /var/log/* /tmp/* \
     && echo "export PATH=\"$MPI_HOME/bin:\$PATH\"" >> /etc/bash.bashrc \
     && printf "\
         sourceryinstitute/docker-base  Copyright (C) 2016 Sourcery Institute \n\
         This program comes with ABSOLUTELY NO WARRANTY.\n\
         This is free software, and you are welcome to redistribute it\n\
         under certain conditions.\n\
         \n\
         see https://github.com/sourceryinstitute/blob/master/LICENSE for the full BSD-3 license\n\n\n" > /etc/motd


# Build-time metadata as defined at http://label-schema.org
    ARG BUILD_DATE
    ARG VCS_REF
    ARG VCS_URL
    LABEL org.label-schema.schema-version="1.0" \
          org.label-schema.build-date="$BUILD_DATE" \
	  org.label-schema.version="1.0" \
          org.label-schema.name="mpich-docker-image" \
          org.label-schema.description="Lightweight image with gcc and mpich 3.1.4" \
          org.label-schema.url="https://github.com/sourceryinstitute/mpich-docker-image/" \
          org.label-schema.vcs-ref="$VCS_REF" \
          org.label-schema.vcs-url="$VCS_URL" \
          org.label-schema.vendor="Sourcery Institute" \
          org.label-schema.license="BSD-3" \
          org.label-schema.docker.cmd="docker run -v $(pwd):/workdir -i -t sourceryinstitute/docker-base:latest"

ENTRYPOINT ["/bin/bash"]

CMD ["-l"]
