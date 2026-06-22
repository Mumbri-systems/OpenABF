#!/bin/sh
if [ -n "$1" ]; then
    VERSION="$1"
else
    VERSION='2.1.0'
fi
# SHORTVERSION='3c1b52a'
wget https://github.com/educelab/OpenABF/archive/v$VERSION/OpenABF-v$VERSION.tar.gz
tar -xf v$VERSION.tar.gz
#remove prohibited copyright content
rm OpenABF-$VERSION/logo.png
rm OpenABF-$VERSION/docs/images/*
tar -cf openabf-$VERSION-clean.tar OpenABF-$VERSION
gzip openabf-$VERSION-clean.tar
