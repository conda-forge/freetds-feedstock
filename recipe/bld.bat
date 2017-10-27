
set OPENSSL_ROOT_DIR=%PREFIX%

set CMAKE_GENERATOR="NMake Makefiles JOM"
mkdir build
cd build

cmake -G %CMAKE_GENERATOR% ^
         -DCMAKE_PREFIX_PATH=%PREFIX% ^
         -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
         -DCMAKE_BUILD_TYPE=Release ^
         -DBUILD_SHARED_LIBS=True ..
if errorlevel 1 exit 1

cmake --build . --config Release --target all
if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1
