#!/bin/sh

VERSION='3c1b52a'

tar -xzvf openabf-$VERSION.tar.gz
rm OpenABF-$VERSION/logo.png
rm OpenABF-$VERSION/docs/images/*
sed -i -e 's/logo.png//' OpenABF-$VERSION/src/Makefile
sed -i -e 's/banner.svg//' OpenABF-$VERSION/src/Makefile
sed -i -e 's/logo.svg//' OpenABF-$VERSION/src/Makefile

tar -czvf openabf-$VERSION.tar.gz OpenABF-$VERSION
