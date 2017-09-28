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
