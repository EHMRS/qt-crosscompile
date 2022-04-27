#!/bin/sh

mkdir /app/build-amd64 > /dev/null
cd /app/build-amd64
cmake ..
make -j $(nproc)
cp /app/build-amd64/src/signallingsimulator /app/release/signallingsimulator-amd64