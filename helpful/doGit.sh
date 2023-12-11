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
git push origin $branch
