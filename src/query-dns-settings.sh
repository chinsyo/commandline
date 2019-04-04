#! /bin/bash

# list all network services

IN=$(networksetup -listallnetworkservices | awk '{if (NR>1) print $0 ";"}');
while IFS=";" read -ra SERVICES; do
    for i in "${SERVICES[@]}"; do
        echo "${i} DNS Servers:"
        networksetup -getdnsservers "${i}"
    done
done <<< "$IN"
