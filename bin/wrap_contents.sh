contents=$1
resultfile=$3
cat "$2_header.html" $contents "$2_footer.html" > $resultfile

