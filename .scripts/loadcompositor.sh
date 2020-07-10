#!/bin/bash

loadcompositor()
{
  setsid -f picom --blur-background --experimental-backends --config /home/asuperpower/.config/picom.conf
}

loadcompositor
