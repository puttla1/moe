#!/bin/bash

[ -f config ] || { echo "Missing config file, check cwd." ; exit 1 ; }
set -e
. config

H=`pwd`
cd $MO_ROOT/eval

echo "Creating $EVAL_USER"
rm -rf eval
mkdir eval
cd eval
cp -a $H/* .
chmod +x bin/*
if [ -d ~/.ssh ] ; then echo "Copying SSH configuration from ~/.ssh" ; cp -a ~/.ssh . ; fi
cd ..
chown -R $EVAL_USER.$EVAL_GROUP eval
chmod 750 eval