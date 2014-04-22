#!/usr/bin/sh

# This script is experimental.

DEST=

function shortlog {
    git log -n 1 --format=short --abbrev-commit
}

function commit_hash {
    echo "$1" | egrep "^commit" | sed 's/commit //'
}

function commit_author {
    echo "$1" | egrep "^Author" | sed 's/Author: //'
}

function commit_msg_header {
    echo "$1" | egrep "^[ \t]" | sed 's/^[ \t]*//'
}

if [ -e $DEST ]
then
    log=$(shortlog)

    echo "COMMIT [$(commit_hash "${log}")] by $(commit_author "${log}")" > $DEST
    echo "COMMIT Message header: $(commit_msg_header "${log}")" > $DEST

else
    echo -e "\t[POST-COMMIT]\tii IRC destination not set in post-commit script!"
    exit 1
fi

unset shortlog
unset commit_hash
unset commit_author
unset commit_msg_header

