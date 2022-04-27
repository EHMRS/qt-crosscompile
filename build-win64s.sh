#!/bin/sh

mkdir /app/build-win64s > /dev/null
cd /app/build-win64s
x86_64-w64-mingw32.static-cmake .. -DQT_CMAKE_DIR=/opt/mxe/usr/x86_64-w64-mingw32.static/qt5/lib/cmake/
make -j $(nproc)
cp /app/build-win64s/src/signallingsimulator.exe /app/release/signallingsimulator-win64.exe