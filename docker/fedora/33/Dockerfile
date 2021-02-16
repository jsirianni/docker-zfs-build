FROM fedora:33

RUN dnf install -y \
    git \
    gcc \
    make \
    autoconf \
    automake \
    libtool \
    rpm-build \
    dkms \
    libtirpc-devel \
    libblkid-devel \
    libuuid-devel \
    libudev-devel \
    openssl-devel \
    zlib-devel \
    libaio-devel \
    libattr-devel \
    elfutils-libelf-devel \
    kernel-devel-$(uname -r) \
    python3 \
    python3-devel \
    python3-setuptools \
    python3-cffi \
    libffi-devel

RUN git clone https://github.com/zfsonlinux/zfs.git

WORKDIR /zfs

RUN git checkout zfs-2.0.3

RUN sh autogen.sh
RUN ./configure --with-config=srpm
RUN make -j1 pkg-utils rpm-dkms
RUN dnf localinstall *.$(uname -p).rpm *.noarch.rpm --skip-broken -y
