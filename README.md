# commandline
70 useful bash scripts collection on Mac OSX.(实用的命令行脚本)
![](https://github.com/chinsyo/commandline/actions/workflows/update_readme.yml/badge.svg)
* avoid-mac-sleeping
```bash
#! /bin/bash

caffeinate -u -t 3600

```

* background-jobs
```bash
#! /bin/bash

# Run command background
sleep 100 &

# List jobs background
jobs

# Bring command to front
fg %1

```

* backup-current-directory
```bash
#! /bin/bash

DATE=`date "+%Y_%m_%d_%H_%M_%S"`
tar -czvf  ~/Desktop/${DATE}.tar ./*

echo ""
echo "*** Back up success, go to ~/Desktop/${DATE}.tar ***"
echo ""

```

* base64-encode-and-decode
```bash
#! /bin/bash

echo "hello" | tr -d \\n | base64

echo "aGVsbG8=" | tr -d \\n | base64 -D

```

* batch-create-files
```bash
#! /bin/bash

seq -w -f "content%g" 10000 10 11000 | xargs touch

```

* big-sur-startup-disk
```bash
#! /bin/bash

sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume

```

* clean-zsh-history
```bash
#! /bin/bash

echo "" > ~/.zsh_history & exec $SHELL -l

```

* cleanup-any-npm-file
```bash
#! /bin/bash

npm ls -gp --depth=0 | awk -F/ '/node_modules/ && !/\/npm$/ {print $NF}' | xargs npm -g rm

```

* convert-file-format
```bash
#! /bin/bash

textutil -convert html file.ext

```

* convert-ringtone-format
```bash
#! /bin/bash

afconvert input.mp3 rintone.m4r -f m4af

```

* cpu-vendor
```bash
#! /bin/bash

sysctl -n machdep.cpu.vendor

```

* create-audiobook
```bash
#! /bin/bash

say -v Alex -f file.txt -o "output.m4a"

```

* create-empty-file
```bash
#! /bin/bash

mkfile 10g ~/Desktop/file

```

* csrutil
```bash
#! /bin/bash

# in recovery mode
csrutil disable;
csrutil enable;


```

* current-wifi
```bash
#! /bin/bash

airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'

```

* cxxfilt
```bash
#! /bin/bash

# C++ name demangling
c++filt __Z4mainiPPc

```

* domain-expiration
```bash
#! /bin/bash

# output: 2026-10-11T11:05:17Z 
whois baidu.com | grep Expiry | sed -n "s/Registry Expiry Date://p" || echo "No matching result"

```

* enable-quicklook-selection
```bash
#! /bin/bash

defaults write com.apple.finder QLEnableTextSelection -bool TRUE;
killall Finder;

```

* extract-device-udid
```bash
#! /bin/bash

system_profiler SPUSBDataType | sed -n -e '/iPad/,/Serial/p' -e '/iPhone/,/Serial/p'


```

* find-codesign
```bash
#! /bin/bash

security find-identity -v -p codesigning

```

* flush-dns-cache
```bash
#! /bin/bash

sudo dscacheutil -flushcache && killall -HUP mDNSResponder && say "DNS cache flushed."

```

* generate-random-chars
![generate-random-chars](assets/generate-random-chars.png)
```bash
#! /bin/bash

jot -r -c 60 a z | rs -g 0 6 | sort | uniq

```

* generate-random-name
```bash
#! /bin/bash

cat /usr/share/dict/propernames | sort -R | head -n 1

```

* generate-random-password
```bash
#! /bin/bash

date | md5 | head -c8; echo

```

* git-rebase-auto-squash
```bash
#! /bin/bash

git add featureA
git commit -m "Feature A is done"
# [dev fb2f677] Feature A is done

git add featureB
git commit -m "Feature B is done"
# [dev 733e2ff] Feature B is done

git add featureA
git commit --fixup fb2f677
# [dev c5069d5] fixup! Feature A is done

git log --oneline
# c5069d5 fixup! Feature A is done
# 733e2ff Feature B is done
# fb2f677 Feature A is done
# ac5db87 Previous commit

git rebase -i --autosquash ac5db87
# pick fb2f677 Feature A is done
# fixup c5069d5 fixup! Feature A is done
# fixup c9e138f fixup! Feature A is done
# pick 733e2ff Feature B is done

```

* git-weekly-report
![git-weekly-report](assets/git-weekly-report.png)
```bash
#! /bin/bash

AUTHOR=$(git config --get user.name)
git log --author="${AUTHOR}" --format="%cd : %s" --since=last.Monday --reverse --no-merges --date=format:'%F %T'


```

* go-source-code-line-count
```bash
#! /bin/bash

find . -name '*.go' | xargs wc -l | sort -nr

```

* graphic-git-logs
![graphic-git-logs](assets/graphic-git-logs.png)
```bash
#! /bin/bash

git log --graph --decorate --pretty=oneline --abbrev-commit --all

```

* heap-stat
```bash
#! /bin/bash

# ref: https://developer.apple.com/videos/play/wwdc2020/10163/
heap Mail | egrep 'class_rw|COUNT'

```

* hidden-desktop
```bash
#! /bin/bash

# chflags nohidden ~/Desktop 
chflags hidden ~/Desktop/*

```

* install-all-system-update
```bash
#! /bin/bash

softwareupdate -ia

```

* install_altool
```bash
#! /bin/bash

sudo ln -s /Applications/Xcode.app/Contents/Applications/Application\ Loader.app/Contents/Frameworks/ITunesSoftwareService.framework/Versions/A/Support/altool /usr/local/bin/altool

```

* join-wifi
```bash
#! /bin/bash

# Replace WIFI_SSID and WIFI_PASSWORD with actual
networksetup -setairportnetwork en0 WIFI_SSID WIFI_PASSWORD

```

* jsonify
![jsonify](assets/jsonify.png)
```bash
#! /bin/bash

curl -sS http://httpbin.org/get | python3 -m json.tool

```

* key-repeat-rate
```bash
#! /bin/bash

defaults write -g KeyRepeat -int 0.02

```

* latest-power-on-time
```bash
#! /bin/bash

last | awk 'NR==1 {print $6}'
```

* md5-digest
```bash
#! /bin/bash

md5 -xs "Hello world!"

```

* most-used-command
```bash
#! /bin/bash

history | awk '{CMD[$2]++;count++;} END { for (a in CMD )print CMD[a] " " CMD[a]/count*100 "% " a }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10

```

* netstat-overview
```bash
#! /bin/bash

netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'

```

* pip-update
```bash
#! /bin/bash

echo "starting upgrade pip packages..."
python3 -m pip list --outdated --format=freeze | grep -v "^\-e" | cut -d = -f 1
| xargs -n1 python3 -m pip install -U

echo "finished upgrade pip packages..."

```

* print-environment
```bash
#! /bin/bash

printenv

```

* python-packages-count
```bash
#! /bin/bash

pip3 list --format=columns | tail +3 | wc -l

```

* python-source-file-count
```bash
#! /bin/bash

tree | grep '.py$' | wc -l

```

* query-dns-settings
```bash
#! /bin/bash

# list all network services

IN=$(networksetup -listallnetworkservices | awk '{if (NR>1) print $0 ";"}');
while IFS=";" read -ra SERVICES; do
    for i in "${SERVICES[@]}"; do
        echo "${i} DNS Servers:"
        networksetup -getdnsservers "${i}"
    done
done <<< "$IN"

```

* query-terminfo-database
```bash
#! /bin/bash

# clear the screen
tput clear

# save cursor position
tput sc

# move cursor position
tput cup 10 13

# hide cursor
tput civis

# show cursor
tput cnorm

# show output
tput rc

```

* rename-git-remote-repo
```bash
#! /bin/bash

# print current remote repo url
git remote -v;

# after go to github.com and edit your repo name
# execute command below to set remote name and url
git remote set-url $0 $1; 

git remote -v;

```

* resign-framework
```bash
#! /bin/bash

codesign -f -s ${IDENTITY} ${FRAMEWORKPATH}

```

* restart
```bash
#! /bin/bash

# sudo reboot
sudo shutdown -r now

```

* retrive-cpu-core-count
```bash
#! /bin/bash

sysctl -a | grep -Eo "core_count:(.+?)$" 

```

* retrive-external-ip
```bash
#! /bin/bash

curl ipecho.net/plain; echo

```

* retrive-system-version
```bash
#! /bin/bash

sw_vers

```

* retrive-website-status
```bash
#! /bin/bash

siteaddr=$1

dig ${siteaddr}
ping ${siteaddr} -c 10
whois ${siteaddr}
nslookup ${siteaddr}
traceroute ${siteaddr}

```

* retrive-wifi-ip-address
```bash
#! /bin/bash

ipconfig getifaddr en0

```

* rvi
```bash
#! /bin/bash

rvictl -s $1
rvictl -l
rvictl -x $1

```

* scan-wifi
```bash
#! /bin/bash

airport -s

```

* schedule-poweron
```bash
#! /bin/bash

# sudo pmset repeat cancel
sudo pmset repeat wakeorpoweron  MTWRF 9:00:00 shutdown MTWRFSU 18:30:00


```

* search-system-command
```bash
#! /bin/bash

whatis $1

```

* setting-terminal-proxy
```bash
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

```

* setup-airport
```bash
#! /bin/bash

sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
export $PATH="/usr/local/bin:$PATH"

```

* share-file-via-http-server
![share-file-via-http-server](assets/share-file-via-http-server.png)
```bash
#! /bin/bash

python3 -m http.server
python -m SimpleHTTPServer

```

* shellcode
![shellcode](assets/shellcode.png)
```bash
#! /bin/bash

# Heavily inspired by https://www.commandlinefu.com/commands/view/6051/get-all-shellcode-on-binary-file-from-objdump
# With slightly modify.

objdump -d $1 | grep '[0-9a-f]:' | cut -f2 -d ':' | cut -f1-6 -d ' ' | tr -s ' ' | tr '\t' ' ' | sed 's/ $//g' | sed 's/ /\\x/g' | paste -s -d '\' - | sed 's/^/"/' | sed 's/$/"/g'

```

* show-dialog
![show-dialog](assets/show-dialog.png)
```bash
#! /bin/bash

osascript -e 'tell app "System Events" to display dialog "Hello world!"'

```

* show-hidden-files
```bash
#! /bin/bash

defaults write com.apple.finder AppleShowAllFiles true

```

* special-variables
```bash
#! /bin/bash

echo "File Name: $0"
echo "First Params: $1"
echo "Second Params: $2"
echo "Quoted Values: $@"
echo "Quoted Values: $*"
echo "Total Params: $#"
echo "Last Status: $?"
echo "Current PID: $$"

```

* ssh-with-alias
```bash
#! /bin/bash

touch ~/.ssh/config;
echo -e "Host ALIAS\n    HostName HOSTADDR\n    User USERNAME" >> ~/.ssh/config; 

```

* ssh-without-password
```bash
#! /bin/bash

ssh-keygen -t rsa;
ssh-copy-id -i ~/.ssh/id_rsa.pub USERNAME@HOSTADDR;

```

* talk-content
```bash
#! /bin/bash

say "Hello world!"

```

* translate-rgb-to-hex
```bash
#! /bin/bash

hex=$(printf "#%02x%02x%02x" ${1:-0} ${2:-0} ${3:-0})
echo -n $hex | pbcopy
echo -e "\033[31m Result ${hex} copy to the clipboard."

```

* translate-words-with-dict
```bash
#! /bin/bash

open dict://$1

```

* zprint
```bash
#! /bin/bash

# Show information about kernel zones
sudo zprint

```

