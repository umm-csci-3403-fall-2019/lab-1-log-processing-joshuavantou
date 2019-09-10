#!/usr/bin/bash
dir=$1
cd $dir
cat var/log/secure* | awk 'match($0,/([a-zA-Z]+) ([a-zA-Z0-9]+) ([a-zA-Z0-9]+):\d\d:\d\d ([a-zA-Z_]+) sshd\[\d{5}\]: Failed password for( invalid user)? ([a-zA-Z]+) from ([a-zA-Z0-9.]+) port \d{4,5} ssh2/, groups) {print groups[1,2,3,5,6]}' > failed_login_data.txt
#sed -E 's/\* ([a-zA-Z]+) ([a-zA-Z]+) ([a-zA-Z]+) [a-zA-Z] sshd\[\d{5}\]: Failed password for invalid user ([a-zA-Z]+) from ([a-zA-Z0-9.]+) port \d{4,5} ssh2/1\2\3\4\5/' < $file > failed_login_data.txt


