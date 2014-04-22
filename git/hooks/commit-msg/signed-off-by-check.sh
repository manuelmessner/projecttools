grep '^Signed-off-by: ' "${1}" > /dev/null || {
    echo -e "\t[PRE-COMMIT]\tThe commit must be signed off."
    exit 1
}
