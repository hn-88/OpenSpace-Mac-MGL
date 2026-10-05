#!/bin/bash

# Ensure we are in the OpenSpace root
if [ ! -f "vcpkg.json" ]; then
    echo "Please run this script from the OpenSpace root directory after merging the OpenSpace-Mac folder."
    exit 1
fi

echo "Configuring CMake for native macOS build..."
mkdir -p build
cd build

# Use the vcpkg toolchain
cmake -DCMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake" ..

# Build
echo "Building OpenSpace..."
make -j$(sysctl -n hw.ncpu)

echo ""
echo "Build complete."
echo "To run with MGL (OpenGL on Metal), use:"
echo "DYLD_LIBRARY_PATH=/path/to/MGL/build/Release ./bin/OpenSpace"
