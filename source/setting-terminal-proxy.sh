#! /bin/bash

variables=("http_proxy" "https_proxy" "ftp_proxy")
for i in "${variables[@]}"
do 
    export $i="socks5://localhost:1080"
done

env | grep -e _proxy | sort

echo -e "Proxy-related environment variables set."

# 
#  Reference: https://gist.github.com/patik/6d40ded40bf93c2f381b
# 
#  You can define the code as bash function and automatic set the 
#  proxy variables when you lauch a bash shell.
#
#  To delete the variables, execute unset $VAR_NAME in bash. 
