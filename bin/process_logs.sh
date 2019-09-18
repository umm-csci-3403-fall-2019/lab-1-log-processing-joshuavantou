#!/usr/bin/bash
HOME=$(pwd)
SCRATCH=$(mktemp --directory)
#cp -r "$@" "$SCRATCH"
#cd "$SCRATCH"
for f in "$@" ;do
	filename=$(basename "$f" "_secure.tgz")
	mkdir "$SCRATCH"/"$filename"
	tar -xzf $f -C "$SCRATCH"/"$filename"
	./bin/process_client_logs.sh "$SCRATCH"/"$filename"
done
./bin/create_username_dist.sh "$SCRATCH"
./bin/create_hours_dist.sh "$SCRATCH"
./bin/create_country_dist.sh "$SCRATCH"
./bin/assemble_report.sh "$SCRATCH"
cp "$SCRATCH"/failed_login_summary.html failed_login_summary.html
tree
cat failed_login_summary.html
