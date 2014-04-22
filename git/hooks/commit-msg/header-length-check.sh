if [ $(cat "${1}" | head -n 1 | wc -c) -gt 50 ]
then
    echo -e "\t[PRE-COMMIT]\tCommit message header longer than 50 characters."
    echo -e "\t[PRE-COMMIT]\tThat's bad style!"
    exit 1
else
    exit 0
fi
