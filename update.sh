#!/bin/bash

tracker=$(cat gtag.js)
lastmod=$(cat lastmod.js)
if [ -x "$*" ]; then
   files=""
   for arg in "$*"
   do
      files="$files $arg"
   done
else
   files=$(find . | grep ".html")
fi
for f in $files
do
   wc=$(wc -l $f | awk '{print $1}')
   echo $wc
   n=$(($wc - 3))
   echo "$(head -n +$n $f)" > $f
   echo $tracker >> $f
   echo $lastmod >> $f
   echo "</body>" >> $f
   echo "</html>" >> $f
   sync
done

