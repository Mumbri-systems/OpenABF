#!/bin/sh

VERSION='3c1b52a0'

tar -xzvf openabf-$VERSION.tar.gz
rm OpenABF-$VERSION/logo.png
sed -i -e 's/logo.png//' OpenABF-$VERSION/src/Makefile

tar -czvf openabf-$VERSION.tar.gz OpenABF-$VERSION
