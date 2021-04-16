#!/bin/sh

LOOK=$(cat $HOME/.config/kdeglobals | awk -F"=" '/LookAndFeelPackage/ {print $2}')
DATE=$(date +%H%M)

# Modify this according to your needs (hhmm)
START="0900"
END="1900"

while [ "${DATE}" -lt "2359" ] ; do
  if [ "${DATE}" -lt "${END}" ] && [ "${DATE}" -gt "${START}" ] ; then
    if [ "${LOOK}" != "org.kde.breezetwilight.desktop" ] ; then
      lookandfeeltool --apply org.kde.breezetwilight.desktop
      notify-send "Twilight Theme : On"
    fi
  else 
    if [ "${LOOK}" != "org.kde.breezedark.desktop" ] ; then
      lookandfeeltool --apply org.kde.breezedark.desktop
      notify-send "Dark Theme : On"
    fi
  fi
  LOOK=$(cat $HOME/.config/kdeglobals | awk -F"=" '/LookAndFeelPackage/ {print $2}')
  DATE=$(date +%H%M)
  sleep 10m
done

