#!/bin/sh

mkdir /app/build-arm32 > /dev/null
cat > /tmp/arm32.cmake << EOF
set (CMAKE_SYSTEM_NAME Linux)
set (CMAKE_C_COMPILER /opt/pi/tools/arm-bcm2708/arm-bcm2708-linux-gnueabi/bin/arm-bcm2708-linux-gnueabi-gcc)
set (CMAKE_CXX_COMPILER /opt/pi/tools/arm-bcm2708/arm-bcm2708-linux-gnueabi/bin/arm-bcm2708-linux-gnueabi-g++)
EOF
cd /app/build-arm32
cmake .. -DCMAKE_TOOLCHAIN_FILE=/tmp/arm64.cmake -DCMAKE_INSTALL_PREFIX=/app/release/
make -j $(nproc)
make install