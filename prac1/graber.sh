#!/bin/bash

# Directories
mkdir -p jpg_images png_images

# Custom cURL to download index.html (from browser copy)
echo "Downloading index.html..."
curl 'https://www.fh-aachen.de/' --compressed \
  -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.5' \
  -H 'Accept-Encoding: gzip, deflate, br, zstd' \
  -H 'Alt-Used: www.fh-aachen.de' \
  -H 'Connection: keep-alive' \
  -H 'Cookie: fhac_cookiemodal-selection=[%22essential%22%2C%22analytics%22%2C%22search%22]; cf_clearance=YOUR_CF_COOKIE_HERE' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Priority: u=0, i' \
  -o index.html

# Extract image paths from user_upload subfolder
echo "Extracting image URLs from index.html..."
grep -oP "/fileadmin/user_upload/[^\"']+\.jpg" index.html | sort -u | while read -r img_path; do
    FULL_URL="https://www.fh-aachen.de${img_path}"
    FILENAME=$(basename "$img_path")

    echo "Downloading $FULL_URL..."
    curl -s "$FULL_URL" -o "jpg_images/$FILENAME"
done

# Convert to PNG using ImageMagick
echo "Converting images to PNG..."
for jpg in jpg_images/*.jpg; do
    [ -e "$jpg" ] || continue
    filename=$(basename -- "$jpg")
    filename_no_ext="${filename%.*}"
    convert "$jpg" "png_images/${filename_no_ext}.png"
    echo "Converted $filename to ${filename_no_ext}.png"
done

echo "✅ Done! All images downloaded and converted."
