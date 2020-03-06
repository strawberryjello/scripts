#!/bin/sh

for i in */; do zip -r "${i%/}-$(date +"%Y%m%d").zip" "$i"; done
