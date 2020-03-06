#!/bin/sh

for i in */; do unzip "${i%/}.zip"; done
