FROM ubuntu:bionic

WORKDIR /

RUN apt-get update

RUN apt-get install -y git

RUN apt-get install -y \
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

RUN git checkout zfs-0.8.3

RUN sh autogen.sh
RUN ./configure
RUN make -s -j$(nproc)
