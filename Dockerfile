FROM ubuntu:21.04

LABEL org.opencontainers.image.source https://github.com/EHRMS/qt-crosscompile

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    apt -y update && \
    apt -y upgrade && \
    apt -y install \
        autoconf automake autopoint bash bison build-essential bzip2 flex \
        g++ g++-multilib gettext git gperf intltool iputils-ping libc6-dev-i386 \
        libffi-dev libgdk-pixbuf2.0-dev libltdl-dev libssl-dev libtool-bin \
        libxml-parser-perl lzip make nano openssl p7zip-full patch perl \
        pkg-config python3 python3-mako ruby scons sed unzip wget xz-utils \
        build-essential cmake qtbase5-dev libqt5serialport5-dev python-is-python3 && \
    apt -y autoremove && \
    apt -y autoclean && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/*

RUN \
    cd /opt && \
    git clone https://github.com/mxe/mxe.git && \
    cd /opt/mxe && \
    NPROC=$(($(nproc)+4)) && \
    make --jobs=$NPROC JOBS=$NPROC MXE_TARGETS='x86_64-w64-mingw32.static' qtbase qtserialport && \
    exit 0

RUN mkdir /opt/pi && cd /opt/pi && git clone https://github.com/raspberrypi/tools

ENV PATH="${PATH}:/opt/mxe/usr/bin"

COPY build-multi.sh /build.sh
COPY build-win64s.sh /build-win64s.sh
COPY build-amd64.sh /build-amd64.sh
COPY build-arm64.sh /build-arm64.sh
COPY build-arm64.sh /build-arm32.sh

RUN chmod +x /build*.sh

CMD ["/build.sh"]