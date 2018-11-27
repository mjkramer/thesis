#!/bin/bash

cd $(dirname $0)/..

while getopts "p" o; do
    case "$o" in
        p) rmpdf=1;;
    esac
done
shift $((OPTIND-1))

exts="aux bbl bcf blg dvi fdb_latexmk fls lof log lot out run.xml synctex.gz toc"

if [[ $rmpdf ]]; then
    exts="$exts pdf"
fi

# don't delete pdfs from ./refs or ./images!
spare_dirs='( -path ./refs -o -path ./images ) -prune'

find $spare_dirs -o -regex '.*\.\('$(echo $exts | sed 's/ /\\|/g')'\)' -print | xargs -t rm
