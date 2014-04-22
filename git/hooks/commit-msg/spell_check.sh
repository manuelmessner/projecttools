if [ ! $(which aspell > /dev/null) -eq 0 ]
then
    echo -e "\t[PRE-COMMIT]\t'aspell' is not installed."
    echo -e "\t[PRE-COMMIT]\tContinuing without spellcheck."
    exit 0
fi

w=$(cat "${1}" | grep -v '^#.*' | aspell list)

if [ ! -z "${w}" ]
then
    echo -e >&2 "\t[PRE-COMMIT]\tPossible spelling errors in commit message text."
    echo -e >&2 "\t${w}"
    exit 1
fi

exit 0
