#!/bin/bash

set -exuo pipefail

if [[ "${build_platform}" != "${target_platform}" ]]; then
  # Don't try to extract information from the odbc_config executable
  rm $PREFIX/bin/odbc_config
fi

./autogen.sh

./configure \
  --enable-krb5 \
  --prefix=$PREFIX \
  --with-unixodbc=$PREFIX \
  --with-openssl=$PREFIX \
  --with-krb5=$PREFIX \
  --host=$HOST \
  --build=$BUILD || (cat config.log; exit 1)
make
# To run this check we need to have access to a mssql instance.
# make check
make install
