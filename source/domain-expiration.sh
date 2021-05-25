#! /bin/bash

# output: 2026-10-11T11:05:17Z 
whois baidu.com | grep Expiry | sed -n "s/Registry Expiry Date://p" || echo "No matching result"
