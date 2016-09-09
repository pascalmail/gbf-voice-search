#!/bin/bash

function echoerr {
    echo $1 >&2
}

function isValidURL {
    URL=$1
    curl --output /dev/null --silent --head --fail $URL
}
function writeList {
    URL=$1
    NAME=$2
    echo "<tr>"
    echo "    <td>$NAME</td>"
    echo "    <td><audio src=\"$URL\" controls preload=none></audio></td>"
    echo "    <td><a href=\"$URL\">Source</a></td>"
    echo "</tr>"
}

# PREFIX=( _mypage _birthday _cutin _ability_us _abilty_them _abilty_win _abilty_lose )
# for pre in ${PREFIX[@]}; do
#     echo $pre
# done
# exit

URLP1="http://game-a5.granbluefantasy.jp/assets/sound/voice/"
CHARA_ID=$1
CHARA_NAME=$2
# RARITY_ID=$3
EXT=".mp3"

if [ -z $CHARA_ID ]; then
    echo "NO CHARA ID!" >&2
    exit
fi
# if [ -z $RARITY_ID ]; then
#     echo "NO RARITY ID!" >&2
#     exit
# fi

echo "<html>"
echo "<head>"
echo "</head>"
echo "<body>"
echo "<h1>$CHARA_NAME VOICE BANK</h1>"
echo "Name: $CHARA_NAME"
echo "ID: $CHARA_ID"
echo "Rarity: $RARITY"
echo "<table>"
echo "<tr>"
echo "<th>Suffix</th>"
echo "<th>Audio</th>"
echo "<th>Source</th>"
echo "</tr>"

# {ID}_v_(\d\d\d)a{0,1}\.mp3
for i in $(seq -f "%03g" 1 599); do
    URLP2="_v_$i"
    URL1=$URLP1$CHARA_ID$URLP2$EXT
    URL2=$URLP1$CHARA_ID$URLP2"a"$EXT
    
    if isValidURL $URL1; then
        echoerr "FOUND $URL1"
        writeList $URL1 $URLP2
    elif isValidURL $URL2; then
        echoerr "FOUND $URL2"
        writeList $URL2 $URLP2"a"
    fi
done


# {ID}_mypage(\d)a{0,1}\.mp3
# {ID}_birthday(\d)a{0,1}\.mp3
# {ID}_cutin(\d)a{0,1}\.mp3
# {ID}_abilty_us(\d)a{0,1}\.mp3
# {ID}_abilty_them(\d)a{0,1}\.mp3
# {ID}_abilty_win(\d)a{0,1}\.mp3
# {ID}_abilty_lose(\d)a{0,1}\.mp3
PREFIX=(_mypage _birthday _cutin _ability_us _abilty_them _abilty_win _abilty_lose)
for pre in ${PREFIX[@]}; do
    for i in $(seq 1 9); do
        URLP2="$pre$i"
        URL1=$URLP1$CHARA_ID$URLP2$EXT      #without 'a'
        URL2=$URLP1$CHARA_ID$URLP2"a"$EXT   #with 'a'

        if isValidURL $URL1; then
            echoerr "FOUND $URL1"
            writeList $URL1 $URLP2
        fi
        if isValidURL $URL2; then
            echoerr "FOUND $URL2"
            writeList $URL2 $URLP2"a"
        fi
    done
done

# {ID}_navi_(\d|\d\d|\d\d\d)a{0,1}\.mp3
for i in $(seq 1 99); do
    URLP2="$_navi_$i"
    URL1=$URLP1$CHARA_ID$URLP2$EXT      #without 'a'
    URL2=$URLP1$CHARA_ID$URLP2"a"$EXT   #with 'a'

    if isValidURL $URL1; then
        echoerr "FOUND $URL1"
        writeList $URL1 $URLP2
    fi
    if isValidURL $URL2; then
        echoerr "FOUND $URL2"
        writeList $URL2 $URLP2"a"
    fi
done

echo "</table>"
echo "</body>"
echo "</html>"
