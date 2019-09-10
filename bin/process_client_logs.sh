#!/usr/bin/bash
dir=$1
cd "$dir" || exit
cat var/log/secure* | sed -E 's/([a-zA-Z]+) ([0-9]+) ([0-9]+):\d\d:\d\d [a-zA-Z_]+ sshd\[\d{5}\]: Failed password for (invalid user )?([a-zA-Z0-9_-]*) from ([a-zA-Z0-9.]+) port \d{4,5} ssh2/1\2\3\4\5/' > failed_login_data.txt
 
	
#awk 'match($0,/([a-zA-Z]+) ([0-9]+) ([0-9]+):\d\d:\d\d ([a-zA-Z_]+) sshd\[\d{5}\]: Failed password for( invalid user)? ([a-zA-Z]+) from ([a-zA-Z0-9.]+) port \d{4,5} ssh2/, groups) {print $1 $2 $3 $5 $6}' > failed_login_data.txt



