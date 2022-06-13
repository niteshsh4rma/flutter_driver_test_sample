for entry in $(ls ./screenshots/):
    echo "![$entry]( $(realpath $entry) )"
