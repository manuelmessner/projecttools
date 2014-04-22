if [ ! $(which aspell > /dev/null) -eq 0 ]
then
    echo "'aspell' is not installed. Continueing without spellcheck."
    exit 0
fi

w=$(cat "${1}" | grep -v '^#.*' | aspell list)

if [ ! -z "${w}" ]
then
    echo >&2 "Possible spelling errors in commit message text."
    echo -e >&2 "\t${w}"
    exit 1
fi

exit 0
