#! /bin/bash

AUTHOR=$(git config --get user.name)
git log --author="${AUTHOR}" --format="%cd : %s" --since=last.Monday --reverse --no-merges --date=format:'%F %T'

