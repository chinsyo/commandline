#! /bin/bash

curl -sS http://httpbin.org/get | python3 -m json.tool
