#! /bin/bash

sysctl -a | grep -Eo "core_count:(.+?)$" 
