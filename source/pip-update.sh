#! /bin/bash

echo "starting upgrade pip packages..."
pip3 list --outdated --format=freeze | grep -v "^\-e" | cut -d = -f 1 | xargs -n1 pip3 install --upgrade;

echo "finished upgrade pip packages..."
