#!/bin/sh

/build-win64s.sh 

mv release/signallingsimulator.exe release/signallingsimulator-win64.exe

rm -rf build

/build-amd64.sh

mv release/signallingsimulator release/signallingsimulator-amd64

rm -rf build
