#!/bin/sh

VERSION='v2.1.0'
# SHORTVERSION='3c1b52a'
wget https://github.com/educelab/OpenABF/archive/$VERSION/OpenABF-$VERSION.tar.gz
tar -xf $VERSION.tar.gz
#remove prohibited copyright content
rm OpenABF-$VERSION/logo.png
rm OpenABF-$VERSION/docs/images/*
tar -cf openabf-$VERSION-clean.tar OpenABF-$VERSION
gzip openabf-$VERSION-clean.tar
