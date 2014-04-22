grep '^Signed-off-by: ' "${1}" > /dev/null || {
    echo "The commit must be signed off."
    exit 1
}
