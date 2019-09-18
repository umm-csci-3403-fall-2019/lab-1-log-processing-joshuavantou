#!/usr/bin/bash
DIR=$1
HOME=$(pwd)
cd "$DIR" || exit
cat country_dist.html hours_dist.html username_dist.html > summary.html
cd "$HOME" || exit
./bin/wrap_contents.sh "$DIR"/summary.html html_components/summary_plots "$DIR"/failed_login_summary.html
rm "$DI"/summary.html
