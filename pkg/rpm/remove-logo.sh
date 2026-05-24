#!/bin/sh

VERSION='3c1b52a02a15007d3dcb7746b08a4f3db0e7a0b6'
SHORTVERSION='3c1b52a'
wget https://github.com/educelab/OpenABF/archive/$VERSION/OpenABF-$SHORTVERSION.tar.gz
tar -xf OpenABF-$SHORTVERSION.tar.gz
#remove prohibited copyright content
rm OpenABF-$VERSION/logo.png
rm OpenABF-$VERSION/docs/images/*
tar -cf OpenABF-$VERSION-clean.tar OpenABF-$VERSION
gzip OpenABF-$VERSION-clean.tar
