# TASMANIAN

The repository produces a working installation of `TASMANIAN-7.0` on Windows.

The steps followed were:

1. Install `CMake` (tested with 3.19.4) choosing "Add CMAKE to system PATH for all users"
2. Download `TASMANIAN-7.0.zip` from https://github.com/ORNL/TASMANIAN/archive/v7.0.zip
3. Extract `TASMANIAN-7.0.zip` to `C:/TASMANIAN/TASMANIAN-7.0`
4. Open `CMake` 
5. Set "Where is the source code to" `C:/TASMANIAN/TASMANIAN-7.0`
6. Set "Where to build the binaries to" `C:/TASMANIAN/TASMANIAN-7.0/build`
7. Press `Configure` and choose "Visual Studio 16 2019" and "x64"
8. Change `CMAKE_INSTALL_PREFIX` to `C:/TASMANIAN-7.0`
9. Clik on `Tasmanian_ENABLE_RECOMMENDED`
10. Pres `Generate`
11. Open command prompt and locate `C:/TASMANIAN/TASMANIAN-7.0/build`
12. Run `cmake --build . --config Release`
13. Run `ctest -C Release`
14. Run `cmake --build . --config Release --target install`
15. Copy `C:/TASMANIAN-7.0` to the repository and zip