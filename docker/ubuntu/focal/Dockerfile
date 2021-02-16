FROM ubuntu:20.04

WORKDIR /

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    build-essential \
    autoconf \
    automake \
    libtool \
    gawk \
    alien \
    fakeroot \
    dkms \
    libblkid-dev \
    uuid-dev \
    libudev-dev \
    libssl-dev \
    zlib1g-dev \
    libaio-dev \
    libattr1-dev \
    libelf-dev \
    linux-headers-$(uname -r) \
    python3 \
    python3-dev \
    python3-setuptools \
    python3-cffi \
    libffi-dev

RUN git clone https://github.com/zfsonlinux/zfs.git

WORKDIR /zfs

RUN git checkout zfs-2.0.3

RUN sh autogen.sh
RUN ./configure
RUN make -s -j$(nproc)
