#!/usr/bin/sh

# This is experimental. Use with care!

git diff --full-index --binary > /tmp/stash.$$
git stash -q --keep-index

echo -e "\t[PRE-COMMIT]\tStyle checking..."

res=0
while read status file
do

    # do the checks in here and set the 'res' variable to 1 if it failed

done < <(git diff --cached --name-status --diff-filter=ACM | \
        grep -P '\.((cc)|(h)|(cpp)|(c))$' )

# if something wents wrong in here, you still have the stash.
git apply --whitespace=nowarn < /tmp/stash.$$ && git stash drop -q
echo -e "\t[PRE-COMMIT]\tSuccessfully reapplied the workspace diff"

rm /tmp/stash.$$
echo -e "\t[PRE-COMMIT]\tRemoved /tmp/stash.$$"

[ $res -ne 0 ] && exit 1
exit 0
