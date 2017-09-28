#! /bin/sh

# Run command background
sleep 100 &

# List jobs background
jobs

# Bring command to front
fg %1
