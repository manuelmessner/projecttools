if [ ! -z "$(grep '^Signed-off-by: ' ${1} | uniq -c | awk '{print $1}' | \
    grep -v '1')" ]
then
    echo -e >&2 "\t[PRE-COMMIT]\tDuplicate Signed-off-by lines in commit message."
    exit 1
fi
