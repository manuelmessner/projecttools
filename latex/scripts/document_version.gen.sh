#!/usr/bin/env sh

#
# This script extracts a version tag from the git repository (the latest) and
# pipes a version command into a file under the ./gen directory of the project.
#
# Versions must have the appropriate format:
#
#  v<n>.<m>[-rc<k>]
#


[ -z "$1" ] && exit 1;

#initialize a var
testy="";

#extract last tag, checking whether there acutally is a tag
if testy="$(git describe --tags --abbrev=0 HEAD)";
    then testy="$( #expand version string
        echo "$testy" | sed 's/^v/Version /;s/-rc/ Release Candidate /;';
    )";
    else testy="Unknown Version";
fi >>/dev/null 2>&1;

#print version command
cat <<EOS > $1
\newcommand{\version}{$testy}
EOS

