#!/bin/sh
HERE=$(readlink -f `dirname $0`)

cd $HERE
ARCHIVES=archives

rm -rf $ARCHIVES

emacs --batch \
        -l elpa-mirror.el \
        --eval="(setq elpamr-default-output-directory \"$ARCHIVES\")" \
        --eval='(elpamr-create-mirror-for-installed)'
