#!/bin/sh

set -e

mkdir -p src
tar xf source.tar.gz --strip-components=1 -C src

for p in "$RECIPE_DIR"/patches/*.patch; do
  patch -p1 --forward --no-backup-if-mismatch -d src -i "$p"
done

mv src/trajopt_optimizers/trajopt_sqp src/trajopt_sqp

# Flags as trajopt_ext/piqp. find_package(piqp) in trajopt_sco and trajopt_sqp finds this install.
mkdir -p piqp_src
tar xf piqp.tar.gz --strip-components=1 -C piqp_src
cmake -GNinja \
    ${CMAKE_ARGS} \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_C_INTERFACE=OFF \
    -S piqp_src \
    -B build_dir/piqp
cmake --build build_dir/piqp --config Release -- -j$CPU_COUNT
cmake --build build_dir/piqp --config Release --target install

for p in trajopt_common trajopt_sco trajopt_ifopt trajopt trajopt_sqp; do

  cmake -GNinja \
    ${CMAKE_ARGS} \
    -DBUILD_SHARED_LIBS=ON \
    -DTESSERACT_ENABLE_TESTING=OFF \
    -DTESSERACT_ENABLE_EXAMPLES=OFF \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -S src/$p \
    -B build_dir/$p

  cmake --build build_dir/$p --config Release -- -j$CPU_COUNT
  cmake --build build_dir/$p --config Release --target install

done
