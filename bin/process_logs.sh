#!/usr/bin/bash
#SCRATCH=`mktemp --directory`
mkdir test123
cp $@ --t test123
#SCRATCH2=`mktemp --directory`
for f in test123/*_secure.tgz;
do tar -xzf "$f";
done	
