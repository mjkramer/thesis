#!/bin/bash

emacs --batch -l ~/.emacs.d/init.el -l $(dirname $0)/wraplines-impl.el
