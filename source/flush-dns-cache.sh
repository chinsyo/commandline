#! /bin/bash

sudo dscacheutil -flushcache && killall -HUP mDNSResponder && say "DNS cache flushed."
