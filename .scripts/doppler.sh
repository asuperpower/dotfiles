#!/bin/sh

doppler_web_root=http://www.bom.gov.au
radar_used=IDR023
doppler_page_path=http://www.bom.gov.au/products/"$radar_used".loop.shtml
echo "$doppler_page_path"
radar_background=/products/radar_transparencies/"$radar_used".background.png
radar_locations=/products/radar_transparencies/"$radar_used".locations.png
radar_range=/products/radar_transparencies/"$radar_used".range.png
radar_topography=/products/radar_transparencies/"$radar_used".topography.png

rm -rf /tmp/doppler;
mkdir -p /tmp/doppler;
cd /tmp/doppler

# doppler_read_html=curl $doppler_page_path 
img_paths=$(curl "${doppler_page_path}" | grep "$(date -u +%Y%m)" | grep "theImageNames")
echo $img_paths
paths_to_read= $(printf "%s\n" "$img_paths" \
  "${radar_background}" \
  "${radar_locations}" \
  "${radar_range}" \
  "${radar_topography}")
echo "paths to read: " $paths_to_read

echo "$doppler_html"
# rm list.txt
touch list.txt &&
echo "$doppler_html" | sed 's/.*"\(.*\)".*/\1/g'  > list.txt
sed -i -e 's|^|'"$doppler_web_root"'|' list.txt

wget -i list.txt

# convert -delay 20 

