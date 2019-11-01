#!/bin/bash

tracker=$(cat gtag.js)
for f in $(find . | grep ".html"); do
   wc=$(wc -l $f | awk '{print $1}')
   echo $wc
   n=$(($wc - 3))
   echo "$(head -n +$n $f)" > $f
   echo $tracker >> $f
   echo "</body>" >> $f
   echo "</html>" >> $f
   sync
done

