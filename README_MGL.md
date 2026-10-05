# OpenSpace Native Mac Build (with MGL)

To build OpenSpace natively on macOS using MGL (OpenGL on Metal), you must merge the files in this folder into the root OpenSpace directory. 

### Changes Included:
1. **`vcpkg.json`**: The `osx` platform restriction has been removed. This allows CMake and vcpkg to download and build all dependencies (like spice, sgct, etc.) natively on macOS.

### Building
1. Merge the files into the OpenSpace root:
   ```bash
   cp -r * ../OpenSpace/
   ```
2. Configure CMake:
   ```bash
   mkdir build
   cd build
   cmake .. 
   ```
   *Note: CMake will automatically invoke vcpkg to download dependencies. This can take some time.*
3. Build:
   ```bash
   make -j$(sysctl -n hw.ncpu)
   ```

### Running with MGL
Since MGL acts as a drop-in replacement for the macOS OpenGL.framework, you will need to inject it when running the application. Depending on how you compiled MGL (as a dynamic library or a framework), you can override the system OpenGL at runtime using dyld environment variables:

```bash
DYLD_LIBRARY_PATH=/path/to/MGL/build/Release ./bin/OpenSpace
```
or
```bash
DYLD_FRAMEWORK_PATH=/path/to/MGL/build/Release ./bin/OpenSpace
```
