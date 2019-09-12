#!/usr/bin/bash
dir=$1
here=$(pwd)
cd "$dir" || exit
cat */failed_login_data.txt | awk 'match($0, /[a-zA-Z] [0-9 ]+ [0-9]+ [a-zA-Z0-9]+ ([0-9.]+)/, groups) {print groups[1]}' | sort > country_dist1.html
join country_dist1.html $here/etc/country_IP_map.txt | awk '{print $2}' | sort | uniq -c > country_dist2.html
awk 'match($0, /[ ]+([0-9]+) ([A-Z]+)/, groups) {print "data.addRow([\x27"groups[2]"\x27, "groups[1]"]);"}' < country_dist2.html > country_dist1.html
cd "$here" || exit
./bin/wrap_contents.sh "$dir"/country_dist1.html html_components/country_dist "$dir"/country_dist.html
rm "$dir"/country_dist1.html
rm "$dir"/country_dist2.html
