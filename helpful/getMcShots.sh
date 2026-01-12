#!/bin/bash


clear
DIR="~/ScreenShots"

if [ ! -d "$DIR" ]; then
  mkdir "$DIR"
  mv ~/.minecraft/screenshots/* ~/ScreenShots/
  echo "Directory '~/ScreenShots' created!"
fi

mv ~/.minecraft/screenshots/* ~/ScreenShots/
echo "Moved Imgs to screenshots"
