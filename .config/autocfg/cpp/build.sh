#!/bin/sh

set -e

BUILD_TYPE=Release
RUN=0
RECONFIGURE=0

for arg in "$@"; do
    case "$arg" in
        debug)
            BUILD_TYPE=Debug
            ;;
        run)
            RUN=1
            ;;
        cfg)
            RECONFIGURE=1
            ;;
    esac
done

if [ "$RECONFIGURE" -eq 1 ]; then
    rm -fr build
    cmake -B build -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
fi
mkdir -p build

if [ "$(uname)" = "Darwin" ]; then
    NPROC=$(sysctl -n hw.ncpu)
else
    NPROC=$(nproc)
fi

cmake --build build -j"$NPROC"

if [ "$RUN" -eq 1 ]; then
    ./build/main
fi

