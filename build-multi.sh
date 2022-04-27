#!/bin/sh

mkdir /app/release

/build-win64s.sh 
cd /app

/build-amd64.sh
cd /app

# /build-arm64.sh
# cd /app
# mv /app/release/signallingsimulator /app/release/signallingsimulator-arm64

# /build-arm32.sh
# cd /app
# mv /app/release/signallingsimulator /app/release/signallingsimulator-arm32
