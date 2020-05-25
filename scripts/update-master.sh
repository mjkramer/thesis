#!/bin/bash

# Take the longlines branch, run wraplines.sh, commit to master.

# NOTE: This will NOT commit any files that aren't already being tracked in the
# master branch.

msg=$@

cd $(dirname $0)/..

curbranch=$(git rev-parse --abbrev-ref HEAD)

git checkout master
git checkout longlines -- .
scripts/wraplines.sh
git commit -a -m "$msg"
git checkout $curbranch
