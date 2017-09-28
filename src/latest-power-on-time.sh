#! /bin/bash

last | awk 'NR==1 {print $6}'