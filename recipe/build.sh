#!/bin/bash

set -e

./configure \
  --enable-krb5 \
  --prefix=$PREFIX \
  --with-unixodbc=$PREFIX \
  --with-openssl=$PREFIX \
  --with-krb5=$PREFIX \
  --host=$HOST \
  --build=$BUILD
make
# To run this check we need to have access to a mssql instance.
# make check
make install
