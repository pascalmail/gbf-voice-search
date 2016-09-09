cat joblist.txt | while read -r line; do 
        l=( $line );
        id=${l[0]}; 
        name=${l[1]}; 
        echo $id;
        echo $name;
        sh check_voice.sh $id $name > "$id"_"$name"_voice.html;
    done
