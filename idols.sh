#!/bin/sh
TODAY=`date +%m-%d`
SPURL="https://sparql.crssnky.xyz/spql/imas/query?query=PREFIX%20schema%3A%20%3Chttp%3A%2F%2Fschema.org%2F%3ESELECT%20(sample(%3Fo)%20as%20%3Fdate)%20(sample(%3Fn)%20as%20%3Fname)%20WHERE%20%7B%20%3Fsub%20schema%3AbirthDate%20%3Fo%3B%20schema%3Aname%7Cschema%3AalternateName%20%3Fn%3BFILTER(regex(str(%3Fo)%2C%20%22$TODAY%22%20)).%7Dgroup%20by(%3Fn)order%20by(%3Fname)"
IDOLS=`curl -s $SPURL | jq ".results.bindings | map(.name.value)" | jq -r 'join(" ")'`
if [ -n "$IDOLS" ]; then
 echo $IDOLS
else
  echo "NO IDOLS"
fi
