#!/bin/sh

for i in */; do zip -r "${i%/}.zip" "$i"; done
