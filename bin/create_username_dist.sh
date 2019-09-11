#!/usr/bin/bash
dir= $1
awk 'match($0, /[a-zA-Z] [0-9 ]+ [0-9]+ ([a-zA-Z0-9]+) [0-9]+/, groups) {print groups[1]}' < r2_output.txt | sort | uniq -c | awk 'match($0, /     ([0-9]+) ([a-zA-Z0-9]+)/, groups) {print groups[2]" "groups[1]}' > username_dist.html
