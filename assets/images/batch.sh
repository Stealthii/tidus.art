#!/usr/bin/env bash

# For all PNG and JPEG files in all subdirectories
for infile in **/*.{png,jpeg}; do
  echo $infile
  # If "_preview in name, quality 75, else 90
  if [[ $infile == *"_preview"* ]]; then
    quality=75
  else
    quality=95
  fi
  cwebp -q "${quality}" -m 6 -pass 10 -mt -sns 25 -sharpness 6 -f 10 "${infile}" -o "${infile%.*}.webp"
done
