#!/bin/sh
### Day/Night Switch between Twilight & Dark plasma5 theme  
### Script must be placed in $HOME/.bin
###
### Autostart with session :
### Add the script to : System settings / Startup and Shutdown / autostart

# Log everything
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>$HOME/.bin/lookandfeel.log 2>&1
echo `date`>$HOME/.bin/lookandfeel.log
set -x

LOOK=$(cat $HOME/.config/kdeglobals | awk -F"=" '/LookAndFeelPackage/ {print $2}')
DATE=$(date +%H%M)
DAY=$(date "+%d %b %Y")

# Wait for the network, specialy with wireless connection
sleep 10s 

# Modify this according to your needs (hhmm)
# Or go to https://www.lecalendrier.fr/calendrier-solaire and choose your city, and note the zip code a the end of url
CITY=30799
curl https://www.lecalendrier.fr/calendrier-solaire?city=${CITY} > $HOME/.bin/city.out

while [ "${DATE}" -lt "2359" ] ; do
START=$(cat $HOME/.bin/city.out | grep "${DAY}" | tail -n2 | cut -d">" -f5 | cut -d"<" -f1 | sed 's/h//' | head -1)
END=$(cat $HOME/.bin/city.out | grep "${DAY}" | tail -n2 | cut -d">" -f7 | cut -d"<" -f1 | sed 's/h//' | head -1)
# Defaults values if url is unreachable or network is down
START=${START:-0900}
END=${END:-2130}

  if [ "${DATE}" -lt "${END}" ] && [ "${DATE}" -gt "${START}" ] ; then
    if [ "${LOOK}" != "org.kde.breezetwilight.desktop" ] ; then
      lookandfeeltool --apply org.kde.breezetwilight.desktop >/dev/null 2>&1
      notify-send "Look&Feel" "Twilight Theme : On"
    fi
  else 
    if [ "${LOOK}" != "org.kde.breezedark.desktop" ] ; then
      lookandfeeltool --apply org.kde.breezedark.desktop >/dev/null 2>&1
      notify-send "Look&Feel" "Dark Theme : On"
    fi
  fi
  LOOK=$(cat $HOME/.config/kdeglobals | awk -F"=" '/LookAndFeelPackage/ {print $2}')
  DATE=$(date +%H%M)
  DAY=$(date "+%d %b %Y")
  sleep 10m
done
