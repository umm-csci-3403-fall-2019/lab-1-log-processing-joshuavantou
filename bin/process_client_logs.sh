#!/usr/bin/bash
dir=$1
cd $dir || exit
#cat var/log/* | sed -E -n 's/([a-zA-Z]+) ([0-9]+) ([0-9]+):\d\d:\d\d [a-zA-Z_]+ sshd\[\d{5}\]: Failed password for (invalid user )?([a-zA-Z0-9_-]*) from ([a-zA-Z0-9.]+) port \d{4,5} ssh2/\1\2\3\5\6/p' > failed_login_data.txt

cat var/log/* | awk 'match($0, /([a-zA-Z]+) ([0-9 ]+) ([0-9][0-9]):[0-9]+:[0-9]+ [a-zA-Z_]+ sshd\[[0-9]+\]: Failed password for( invalid user)? ([a-zA-Z0-9]+) from ([a-zA-Z0-9.]+) port [0-9]+ ssh2/, groups) {print groups[1]" " groups[2]" "groups[3]" "groups[5]" "groups[6]}' > failed_login_data.txt
