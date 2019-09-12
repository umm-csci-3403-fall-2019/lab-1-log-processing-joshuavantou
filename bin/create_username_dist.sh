#!/usr/bin/bash
dir=$1
here=$(pwd)
cd "$dir" || exit
cat */failed_login_data.txt | awk 'match($0, /[a-zA-Z] [0-9 ]+ [0-9]+ ([a-zA-Z0-9]+) [0-9]+/, groups) {print groups[1]}' | sort | uniq -c | awk 'match($0, /[ ]+([0-9]+) ([a-zA-Z0-9]+)/, groups) {print "data.addRow([\x27"groups[2]"\x27, "groups[1]"]);"}' > username_dist1.html
cd "$here" || exit
./bin/wrap_contents.sh "$dir"/username_dist1.html html_components/username_dist "$dir"/username_dist.html
rm "$dir"/username_dist1.html
