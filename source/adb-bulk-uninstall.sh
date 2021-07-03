#! /bin/bash

adb shell "pm list packages -3 | cut -c9- | xargs -r -n1 -t pm uninstall"