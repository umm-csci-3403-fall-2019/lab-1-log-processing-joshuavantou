#!/bin/bash
headerfile=$2_header.html
footerfile=$2_footer.html
filename=$3
$(cat $headerfile $1 $footerfile > $filename)

