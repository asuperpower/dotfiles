killall create_ap ;
rm -rf /tmp/create_ap* ;
killall hostapd ;
sleep 2 ;
create_ap -c 5 -w 2 -m nat --hidden --country AU wlp39s0 enp42s0 air ketchup!
