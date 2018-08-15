#! /bin/bash

system_profiler SPUSBDataType | sed -n -e '/iPad/,/Extra/p' -e '/iPhone/,/Extra/p'
