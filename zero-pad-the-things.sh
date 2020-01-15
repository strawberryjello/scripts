#!/bin/sh

# see: http://stackoverflow.com/a/3672345
for a in [0-9]*.[a-zA-Z]*; do
    mv $a `printf %03d.%s ${a%.*} ${a##*.}`
done
