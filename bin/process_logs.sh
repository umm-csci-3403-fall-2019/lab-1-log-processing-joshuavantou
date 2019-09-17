#!/usr/bin/bash
HOME=$(pwd)
SCRATCH=$(mktemp --directory)
cp -r "$@" "$SCRATCH"
cd "$SCRATCH"
for f in ./* do
	if [ -x "$f" ]; then
		tar -xvf $f.tar.gz
	fi
done

