w=$(cat "$1" | egrep -i "(also|while here|^And)")

if [ ! -z "${w}" ]
then
    echo -e >&2 <<EOS
\t[PRE-COMMIT]\tCommit message hints that there is the possibility to split the commit:

\t${w}

\t[PRE-COMMIT]\tDo you want to split the commit? [Y|n]
EOS

local answer
read answer
echo ""
if [ "${answer}" =~ ^[Nn]$ ]
then
    exit 0
else
    exit 1
fi
