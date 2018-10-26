#!/bin/bash

TARGET=x86_64-unknown-fuchsia
HOST=x86_64-unknown-linux
CLANG_BIN=/home/ian/git/zircon/prebuilt/downloads/clang/bin
SYSROOT=/home/ian/fuchsia-sdk/sdk/arch/x64/sysroot/

export PATH=${CLANG_BIN}:${PATH}
./configure --target=${TARGET} \
  --prefix=$HOME/ghc-fuchsia \
  --enable-unregisterised \
  ac_cv_func_eventfd=no \
  fp_prog_ar=llvm-ar NM=llvm-nm "LD=${CLANG_BIN}/clang" OBJDUMP=llvm-objdump "CC=${CLANG_BIN}/clang" \
  SRC_CC_OPTS="--sysroot=${SYSROOT} --target=${TARGET}" \
  SRC_LD_OPTS="--sysroot=${SYSROOT} --target=${TARGET}" \
  USE_TIMER_CREATE=0


#  --with-hs-cpp-flags="--sysroot=${SYSROOT} -E -undef -traditional -Wno-invalid-pp-token -Wno-unicode -Wno-trigraphs" \
