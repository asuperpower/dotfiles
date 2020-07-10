#!/bin/bash

reloadwm()
{
  pkill picom
  i3-msg restart
  /home/asuperpower/.scripts/loadcompositor.sh
}

reloadwm

