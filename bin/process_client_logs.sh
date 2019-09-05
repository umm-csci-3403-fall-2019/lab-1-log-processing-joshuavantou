#!/usr/bin/bash
dir=$1
cd $dir
for file in *.txt
do
	sed -E 's/\* ([a-zA-Z]+) ([a-zA-Z]+) ([a-zA-Z]+) computer_name sshd\[\d{5}\]: Failed password for invalid user ([a-zA-Z]+) from ([a-zA-Z0-9.]+) port \d{4,5} ssh2/1. \1\n2. \2\n/' < $file > failed_login_data.txt
done
