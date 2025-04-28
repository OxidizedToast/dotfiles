function help_screen(){
  cat <<EOF
    Usage: gpSystem [options]
    Options:
    help || -h    - Prints this screen
    install || -i - Installs dotfiles into system
    get || -g     - Gets dotfiles
    push || -p    - Pushes dotfiles
EOF
}
function get_dots(){
  # Downloads repository as a zip & unzips via tar and removes the zip due to directory creation
  curl -L -o dotfiles.zip https://github.com/oxidizedtoast/dotfiles/archive/refs/heads/main.zip
  unzip -q dotfiles.zip && rm -rf dotfiles.zip
  mv dotfiles-main dotfiles
}

if [ "$1" == "-g" ] || [ "$1" == "get" ]; then
  echo "Getting dotfiles..."
  get_dots
  if true; then
    echo "Dotfiles successfully downloaded"
  else
    echo "Dotfiles failed to download"
  fi
elif [ "$1" == "-p" ] || [ "$1" == "push" ]; then
  echo "Pushing dotfiles..."
  # Impliment a way to download repo and copy data over and push it or just push what is already provided
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
