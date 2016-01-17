#!/bin/bash
if [ "$#" -lt 3 ]; then
    echo "ERROR args"
    exit 1
fi

simage=$1
size=$2
timage=$3
tdir="tilemap"

if [ ! -e $simage ]; then
    echo "ERROR no find src image"
    exit 1
fi

if [ $# == 4 ]; then
    $tdir=$4
fi



if [ ! -d $tdir ]; then
    mkdir -p $tdir
fi



convert $simage -crop $size $timage
tmpstr=`(echo $timage |sed 's/\([a-zA-Z_]\)\.\(.*$\)/\1/g')`"-"

mv $tmpstr* $tdir

for i in $tdir/*; do
    echo `identify $i`
done


exit 0
