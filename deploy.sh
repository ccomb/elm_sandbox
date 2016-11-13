#!/bin/bash

set -e
name=${1%%.elm}
targetdir=/srv/web/sandbox/elm/$name

test $name || echo "give the elm file as an argument"
test $name || exit 0
elm make $name.elm --output main.js
ssh cody "rm -rf $targetdir && mkdir -p $targetdir"
rsync -Pr index.html main.js cody:/srv/web/sandbox/elm/$name/
ssh cody sed -i "s/Main/$name/" $targetdir/index.html
