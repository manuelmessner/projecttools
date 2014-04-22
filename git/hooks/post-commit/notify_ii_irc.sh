#!/usr/bin/sh

# This script is experimental.

#
# The purpose of this script is to use "ii" from suckless, which is a minimal
# irc client. With this client, you can write something to a file and it writes
# it to the appropriate irc channel:
#
#   echo "mymessage" > /the/path/to/the/#channel/in
#
# and read by reading a file:
#
#   tail -f /the/path/to/the/#channel/out
#
# With this post-commit hook you can write to an IRC channel that you just
# committed.
#


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

