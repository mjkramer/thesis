#!/bin/bash

exts="aux bbl bcf blg dvi fdb_latexmk fls lof log lot out run.xml synctex.gz toc"

find -regex '.*\.\('$(echo $exts | sed 's/ /\\|/g')'\)' | xargs rm
