#! /bin/bash

airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'
