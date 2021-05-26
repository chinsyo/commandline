#! /bin/bash

echo "starting upgrade pip packages..."
python3 -m pip list --outdated --format=freeze | grep -v "^\-e" | cut -d = -f 1
| xargs -n1 python3 -m pip install -U

echo "finished upgrade pip packages..."
