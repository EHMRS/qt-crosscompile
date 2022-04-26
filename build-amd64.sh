#!/bin/sh

mkdir build-amd64 > /dev/null
cd build-amd64
cmake .. -DCMAKE_INSTALL_PREFIX=/app/release/
make -j $(nproc)
make install