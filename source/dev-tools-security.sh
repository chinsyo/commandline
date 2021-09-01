#! /bin/bash

# If you didn't enable Developer Mode using Xcode you will be asked to authorize the debugger every time you use it. To enable Developer Mode and only have to authorize once per session use:
sudo /usr/sbin/DevToolsSecurity -enable

# You might also need to add your user to the developer group:
sudo dscl . append /Groups/_developer GroupMembership $(whoami)
