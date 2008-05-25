#!/bin/bash

[ -f config ] || { echo "Missing config file, check cwd." ; exit 1 ; }
set -e
. config

H=`pwd`
cd $MO_ROOT/eval

# mo-test home
for u in $TEST_USERS ; do
	echo "Creating $u"
	rm -rf ./$u
	mkdir $u
	chown $u.$TEST_GROUP $u
	chmod 770 $u
	cp $H/bin/box eval/bin/box-$u
	chown $u.$EVAL_GROUP eval/bin/box-$u
	chmod 4550 eval/bin/box-$u
done