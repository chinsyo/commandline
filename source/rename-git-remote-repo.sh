#! /bin/bash

# print current remote repo url
git remote -v;

# after go to github.com and edit your repo name
# execute command below to set remote name and url
git remote set-url $0 $1; 

git remote -v;
