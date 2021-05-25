#! /bin/bash

jot -r -c 60 a z | rs -g 0 6 | sort | uniq
