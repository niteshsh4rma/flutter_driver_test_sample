ls ./screenshots/
for entry in  *.png ; do
   echo "![$entry]( $(realpath $entry) )"
done