#!/bin/bash

loadcompositor()
{
  setsid -f picom --experimental-backends --config /home/asuperpower/.config/picom.conf
}

loadcompositor
