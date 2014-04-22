#!/usr/bin/sh

if git rev-parse --verify HEAD >/dev/null 2>&1
then
    head="HEAD"
else
    head="4b825dc642cb6eb9a060e54bf8d69288fbee4904"
fi

git diff-index --check --cached "${head}" --
