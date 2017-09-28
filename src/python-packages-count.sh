#! /bin/sh

pip3 list --format=columns | tail +3 | wc -l
