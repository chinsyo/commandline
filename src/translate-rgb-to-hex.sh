#! /bin/bash

hex=$(printf "#%02x%02x%02x" ${1:-0} ${2:-0} ${3:-0})
echo -n $hex | pbcopy
echo -e "\033[31m Result ${hex} copy to the clipboard."
