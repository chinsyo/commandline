#! /bin/bash

touch ~/.ssh/config;
echo -e "Host ALIAS\n    HostName HOSTADDR\n    User USERNAME" >> ~/.ssh/config; 
