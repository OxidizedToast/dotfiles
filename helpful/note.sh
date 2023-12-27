#!/bin/bash
clear
echo "Note Creater!"

sleep 2;
clear

echo "What is the name of the note"
read noteName
clear

nvim "$noteName.txt"

fullFile="$noteName.txt"

if [ "$PWD" == "$HOME/Notes" ]; then
    echo "Note created successfully"
else
    if [ "$PWD" != "$HOME/Notes" ]; then
        mv "$fullFile" "$HOME/Notes/"
        echo "Note moved to $HOME/Notes"
    fi
fi
