@echo off
setlocal enabledelayedexpansion

if exist src rmdir /s /q src
mkdir src
echo */ci/*> tar_excludes.txt
tar xf source.tar.gz --strip-components=1 -C src -X tar_excludes.txt

move src\trajopt_optimizers\trajopt_sqp src\trajopt_sqp

REM Flags as trajopt_ext/piqp: PIQP does not install its DLL, so static on Windows.
if exist piqp_src rmdir /s /q piqp_src
mkdir piqp_src
tar xf piqp.tar.gz --strip-components=1 -C piqp_src
if !errorlevel! neq 0 exit !errorlevel!
cmake -GNinja ^
    %CMAKE_ARGS% ^
    -DBUILD_SHARED_LIBS=OFF ^
    -DUSE_MSVC_RUNTIME_LIBRARY_DLL=ON ^
    -DBUILD_TESTS=OFF ^
    -DBUILD_EXAMPLES=OFF ^
    -DBUILD_C_INTERFACE=OFF ^
    -S piqp_src ^
    -B build_dir\piqp
if !errorlevel! neq 0 exit !errorlevel!
cmake --build build_dir\piqp --config Release -j 4
if !errorlevel! neq 0 exit !errorlevel!
cmake --build build_dir\piqp --config Release --target install
if !errorlevel! neq 0 exit !errorlevel!

for %%p in (trajopt_common trajopt_sco trajopt_ifopt trajopt trajopt_sqp) do (
  cmake -GNinja ^
    %CMAKE_ARGS% ^
    -DBUILD_SHARED_LIBS=ON ^
    -DUSE_MSVC_RUNTIME_LIBRARY_DLL=ON ^
    -DTESSERACT_ENABLE_TESTING=OFF ^
    -DTESSERACT_ENABLE_EXAMPLES=OFF ^
    -DCMAKE_VERBOSE_MAKEFILE=ON ^
    -S src\%%p ^
    -B build_dir\%%p
  if !errorlevel! neq 0 exit !errorlevel!
  cmake --build build_dir\%%p --config Release -j 4
  if !errorlevel! neq 0 exit !errorlevel!
  cmake --build build_dir\%%p --config Release --target install
  if !errorlevel! neq 0 exit !errorlevel!
)
