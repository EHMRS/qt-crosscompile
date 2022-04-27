#!/bin/sh

mkdir /app/build-arm64 > /dev/null
cat > /tmp/arm64.cmake << EOF
set (CMAKE_SYSTEM_NAME Linux)
set (CMAKE_C_COMPILER /opt/pi/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc)
set (CMAKE_CXX_COMPILER /opt/pi/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-g++)
EOF
cd /app/build-arm64
cmake .. -DCMAKE_TOOLCHAIN_FILE=/tmp/arm64.cmake -DCMAKE_INSTALL_PREFIX=/app/release/
make -j $(nproc)
make install