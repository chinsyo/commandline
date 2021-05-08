#! /bin/bash

# Heavily inspired by https://www.commandlinefu.com/commands/view/6051/get-all-shellcode-on-binary-file-from-objdump
# With slightly modify.

objdump -d $1 | grep '[0-9a-f]:' | cut -f2 -d ':' | cut -f1-6 -d ' '|tr -s ' '|
    tr '\t' ' ' | sed 's/ $//g' | sed 's/ /\\x/g' | paste -s -d '\' - | sed 's/^/"/' | sed 's/$/"/g'
