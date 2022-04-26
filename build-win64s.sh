#!/bin/sh

cd /app
mkdir build-win64s > /dev/null
cd build-win64s
x86_64-w64-mingw32.static-cmake .. -DQT_CMAKE_DIR=/opt/mxe/usr/x86_64-w64-mingw32.static/qt5/lib/cmake/ -DCMAKE_INSTALL_PREFIX=/app/release/
make -j $(nproc)
make install
cd /app