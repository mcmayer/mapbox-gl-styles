#!/usr/bin/env bash -e
# This script scans the directory given in as the first command line argument
# and gunzips each .png file (they aren't truly png files!) and saves the result
# as a .pbf file
for f in `find $1 -name "*.png" | sed 's/\.png//'`; do
  echo $f.png
  gzip -dc $f.png > $f.pbf
  rm $f.png
done
