#!/usr/bin/env bash
# One-off: pulls the images from the live WordPress site into ./images.
# Run it BEFORE you switch DNS (the old site must still be reachable).
set -euo pipefail
cd "$(dirname "$0")"
BASE="https://domekandrzejowka.pl/wp-content"
mkdir -p images/gallery/thumbs

# header image (WordPress "cropped" custom header) and social-share image
curl -fL "$BASE/uploads/2023/04/cropped-PXL_20220717_105647723-scaled-1.jpg" -o images/header.jpg
curl -fL "$BASE/uploads/2012/02/DSC_5941.jpg" -o images/og.jpg

while read -r name; do
  [ -z "$name" ] && continue
  curl -fL --retry 2 "$BASE/gallery/domek/$name.jpg"               -o "images/gallery/$name.jpg"
  curl -fL --retry 2 "$BASE/gallery/domek/thumbs/thumbs_$name.jpg" -o "images/gallery/thumbs/$name.jpg"
done < gallery.txt

echo "Done: $(find images -type f | wc -l) files, $(du -sh images | cut -f1)"
