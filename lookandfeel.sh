#!/bin/sh

LOOK=$(cat $HOME/.config/kdeglobals | awk -F"=" '/LookAndFeelPackage/ {print $2}')
DATE=$(date +%H%M)
DAY=$(date "+%d %b %Y")

# go to https://www.lecalendrier.fr/calendrier-solaire and choose your city, and note the zip code a the end of url
# Example, for Patis
CITY=30799
curl https://www.lecalendrier.fr/calendrier-solaire\?city\=${CITY} > $HOME/.bin/city.out

START=$(cat $HOME/.bin/city.out | grep "${DAY}" | tail -n2 | cut -d">" -f5 | cut -d"<" -f1 | sed 's/h//' | head -1)
END=$(cat $HOME/.bin/city.out | grep "${DAY}" | tail -n2 | cut -d">" -f7 | cut -d"<" -f1 | sed 's/h//' | head -1)

while [ "${DATE}" -lt "2359" ] ; do
  if [ "${DATE}" -lt "${END}" ] && [ "${DATE}" -gt "${START}" ] ; then
    if [ "${LOOK}" != "org.kde.breezetwilight.desktop" ] ; then
      lookandfeeltool --apply org.kde.breezetwilight.desktop
      notify-send "Look&Feel" "Twilight Theme : On"
    fi
  else 
    if [ "${LOOK}" != "org.kde.breezedark.desktop" ] ; then
      lookandfeeltool --apply org.kde.breezedark.desktop
      notify-send "Look&Feel" "Dark Theme : On"
    fi
  fi
  LOOK=$(cat $HOME/.config/kdeglobals | awk -F"=" '/LookAndFeelPackage/ {print $2}')
  DATE=$(date +%H%M)
  sleep 10m
done
