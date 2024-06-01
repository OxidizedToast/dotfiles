#!/bin/bash

clear

echo "Welcome to your screenshot manager!"
sleep 1.5


# Asks file name
echo "What should the file name be?"
read fileName
clear

# Asks file type
echo "What do you want the file type to be?"
echo "Do not include the dot ex:jpg not .jpg"
read fileType
clear

# Simplifys file
file="$fileName.$fileType"

echo "taking screen shot in 3s"
sleep 3
#screen shots selected area(from slurp)
grim -g "$(slurp)" "$file"

echo "File: $file created!"

# Explains where file is
if [ "$PWD" == "$HOME/ScreenShots" ]; then
    echo "File created in $PWD"
else
    # Check if the current working directory is not ~/ScreenShots
    if [ "$PWD" != "$HOME/ScreenShots" ]; then
        mv "$file" "$HOME/ScreenShots/"
        echo "File moved to $HOME/ScreenShots"
    else
        mkdir $HOME/ScreenShots
        mv "$file" "$HOME/Screenshots/"
        echo "Created ScreenShots Directory"
        echo "Moved file to $HOME/ScreenShots"
fi
