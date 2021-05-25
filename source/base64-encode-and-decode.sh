#! /bin/bash

echo "hello" | tr -d \\n | base64

echo "aGVsbG8=" | tr -d \\n | base64 -D
