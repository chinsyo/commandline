#! /bin/bash

sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
export $PATH="/usr/local/bin:$PATH"
