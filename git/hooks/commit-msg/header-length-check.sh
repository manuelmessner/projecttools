if [ $(cat "${1}" | head -n 1 | wc -c) -gt 50 ]
then
    echo "Commit message header longer than 50 characters. That's bad style!"
    exit 1
else
    exit 0
fi
