#!/bin/bash

echo "<html>"
echo "<head></head>"
echo "<body>"
echo "    <h1> GBF CHARA VOICE URL </h1>"
echo "    <ul>"
for file in FOUND/*.html; do
    filename=${file##*/}
    name1=${filename%_voice.html}
    name2=${name1:11}
    name=${a//_/ }
    echo "        <li><a href=\"$file\">$name</a></li>"
done
echo "    </ul>"
echo "</body>"
echo "</html>"
