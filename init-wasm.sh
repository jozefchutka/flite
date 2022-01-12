#!/bin/bash

rm -rf build
rm -rf modules
git submodule sync --recursive
git submodule update --init --recursive --remote

(cd modules/emsdk/ && \
    ./emsdk install 2.0.34 && \
    ./emsdk activate 2.0.34)
