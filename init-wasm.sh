#!/bin/bash

rm -rf build
rm -rf modules
git submodule sync --recursive
git submodule update --init --recursive --remote

(cd modules/emsdk/ && \
    ./emsdk install 3.1.1 && \
    ./emsdk activate 3.1.1)
