#! /bin/bash

echo "starting upgrade pip packages..."
pip3 list --outdated --format=columns | awk "NR>2 {print $1}" | xargs -n1 pip3 install --user --upgrade
echo "finished upgrade pip packages..."
