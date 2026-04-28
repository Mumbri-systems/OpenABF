#!/bin/sh

VERSION='3c1b52a02a15007d3dcb7746b08a4f3db0e7a0b6'

rm OpenABF-$VERSION/logo.png
rm OpenABF-$VERSION/docs/images/*
sed -i -e 's/logo.png//' OpenABF-$VERSION/src/Makefile
sed -i -e 's/banner.svg//' OpenABF-$VERSION/src/Makefile
sed -i -e 's/logo.svg//' OpenABF-$VERSION/src/Makefile
