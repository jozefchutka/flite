#!/bin/bash

source ./modules/emsdk/emsdk_env.sh

CFLAGS=(
    -O3
    -DCST_AUDIO_NONE)

CONF_FLAGS=(
    --host=wasm32-wasi
    --enable-shared=no
    --disable-shared
    --with-langvox=min)

BUILD_FLAGS=(
    -s INVOKE_RUN=0
    -s MODULARIZE=1
    -s EXPORT_NAME="createFlite"
    -s EXPORTED_RUNTIME_METHODS="[callMain,FS]"
    -s INITIAL_MEMORY=33554432
    -s ALLOW_MEMORY_GROWTH=1
    -o $PWD/bin/flite.js)

CFLAGS="${CFLAGS[@]}" emconfigure ./configure "${CONF_FLAGS[@]}"
emmake make clean
BUILD_FLAGS="${BUILD_FLAGS[@]}" emmake make
