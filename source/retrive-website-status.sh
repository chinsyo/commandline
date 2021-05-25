#! /bin/bash

siteaddr=$1

dig ${siteaddr}
ping ${siteaddr} -c 10
whois ${siteaddr}
nslookup ${siteaddr}
traceroute ${siteaddr}
