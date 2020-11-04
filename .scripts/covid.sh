#!/bin/sh
# Coronavirus tracking module for polybar for victoria
#  For information purposes only
#  Inspired by https://youtu.be/cQ03v4d3QEo

[[ "$(stat -c %y ~/.cache/corona 2>/dev/null | cut -d ':' -f1 )" != "$(date '+%Y-%m-%d %H')" ]] &&
  curl -s https://www.dhhs.vic.gov.au/victorian-coronavirus-covid-19-data > ~/.cache/corona ;


# ack doesn't seem to work when running from polybar?
# ack -A 4 "lvn-box lvn-box-top" ~/.cache/corona |
cat ~/.cache/corona | grep -A 4 "lvn-box" | 
sed "s/<[^>]*>//g ;s/\s*//g ;s/--//g ;s/\t//g" | sed ':a;N;$!ba;s/\n/;/g ;s/;*;/;/g' |
awk -F';' '{print "🤒 " $14 "  (🔼" $2 ") 💀 " $12 }' 

# Mask doesn't work with my emoji font...
# awk -F';' '{print "😷" $8 "  (🔼" $2 ") 💀" $6 }' 
