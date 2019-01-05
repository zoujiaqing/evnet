#!/bin/sh

# Run this script at the directory which holds it.

#Try to checkout to the lastest TAG and compile it
#
#VERSION=`grep PACKAGE_VERSION ../cmake/packages.cmake  | head -1 | awk -F\" '{print $2}' | awk -F"$" '{print $1}'`
#VERSION=`echo -n ${VERSION}`
#
# git checkout $VERSION
#

set -x
 
SOURCE_DIR=`pwd`/..
BUILD_TYPE=release
BUILD_DIR=${SOURCE_DIR}/build-ios-${BUILD_TYPE}

rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR \
  && cd $BUILD_DIR \
  && cmake -DCMAKE_OSX_ARCHITECTURES="arm64" -DCMAKE_TOOLCHAIN_FILE=../cmake/ios.toolchain.cmake -DCMAKE_BUILD_TYPE=Release $SOURCE_DIR \
  && make -j6

