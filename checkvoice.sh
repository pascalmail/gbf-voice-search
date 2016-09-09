#!/bin/bash

function echoerr {
	echo $1 >&2
}

URLP1="http://game-a5.granbluefantasy.jp/assets/sound/voice/"
URLP2="_v_"
CHARA_ID=$1
CHARA_NAME=$2
EXT=".mp3"

if [ -z $CHARA_ID ]; then
	echo "NO CHARA ID!" >&2
	exit
fi
RARITY_ID=""


echo "<html>"
echo "<head>"
echo "</head>"
echo "<body>"
echo "<h1>$CHARA_NAME VOICE BANK</h1>"
echo "<ol>"
for i in $(seq -f "%03g" 1 399); do
	URL=$URLP1$CHARA_ID$URLP2$i$EXT
	if curl --output /dev/null --silent --head --fail $URL; then
		echo "FOUND $URL" >&2
		echo "<li> v_$i"
		echo "    <audio src=\"$URL\" controls preload=none></audio>"
		echo "    <a href=\"$URL\">Source</a>"
		echo "</li>"
	else
		echo "NONE $URL" >&2
	fi
done

echo "</ol>"

echo "</body>"
echo "</html>"
