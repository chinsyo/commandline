#! /bin/bash

find . -name '*.go' | xargs wc -l | sort -nr
