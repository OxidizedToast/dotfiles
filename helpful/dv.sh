function help_screen(){
  cat <<EOF
    Usage: dv [options]
    Options:
    help || -h    - Prints this screen
    install || -i - Installs dotfiles into system
    get || -g     - Gets dotfiles
    push || -p    - Pushes dotfiles
EOF
}
function get_dots(){
  # Downloads repository as a zip & unzips via tar and removes the zip due to directory creation
  git clone https://github.com/oxidizedtoast/dotfiles
  cd dotfiles
}
current_dir=$(basename "$PWD")


if [ "$1" == "-g" ] || [ "$1" == "get" ]; then
  echo "Getting dotfiles..."
  get_dots
  if true; then
    echo "Dotfiles successfully downloaded"
  else
    echo "Dotfiles failed to download"
  fi
  elif [ "$1" == "-p" ] || [ "$1" == "push" ]; then
    if [ "$current_dir" == "dotfiles" ]; then
    echo -n
    elif [ -d "dotfiles" ]; then
      echo "Entering dotfiles"
      cd dotfiles
    else
      echo "Dotfiles not found"
      echo "Try 'dv -g'"
      exit 1
    fi
    git add .
    echo "What is the commit message?"
    read commit_message
    echo "Pushing dotfiles..." 
    git push origin main
elif [ "$1" == "-h" ] || [ "$1" == "help" ]; then
  help_screen
elif [ "$1" == "-i" ] || [ "$1" == "install" ]; then
  echo "Installing"
  cd ~
  get_dots
  cd dotfiles-main

  #install_script
elif [ -z "$1" ]; then
  # If the first parameter is empty / zeo
  echo "No parameter(s) entered"
  exit 1
else
  echo "Command '$1' unknown"
  help_screen
  exit 1
fi

: '

  Idk how to find how to push directly to github without cloning but if I have to clone whatever
  Need to find out how to get my system dotfiles downloaded fast & or installed fast

'
