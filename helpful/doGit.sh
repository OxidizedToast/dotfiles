#!/bin/bash
#
clear
echo "Whats the commit message"
read commitMSG
clear

echo "Whats the branch?"
read branch
clear

git add .
git commit -m "$commitMSG"

echo "Do you want to force push? Y/n "
read force
clear

if [ "$force" == "Y" ] || [ "$force" == "y" ]; then
    git push --force origin "$branch"
else
    git push origin "$branch"
fi

