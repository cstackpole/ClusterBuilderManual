#!/bin/bash -
for a in `ls *.markdown`
do
	newname=`echo $a | sed -e 's/markdown/html/'`
	markdown $a > ../$newname
done
