#!/bin/bash

cd $(dirname $0)/..

files=$(find chapters -name '*.tex')

for f in $files; do
    tmpf=$(mktemp)
    fmt -w 80 $f > $tmpf
    mv $tmpf $f
done
