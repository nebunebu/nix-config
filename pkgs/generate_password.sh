#!/usr/bin/env bash

pwgen -sy 16 1 | wl-copy
notify-send "password" "Randomly generated password is copied to your clipboard"
