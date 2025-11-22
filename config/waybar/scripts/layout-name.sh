#!/bin/bash

layout=$(
  hyprctl devices | awk '
    BEGIN { RS="Keyboard"; FS="\n" }
    {
      main = 0
      keymap = ""
      for (i = 1; i <= NF; i++) {
        if ($i ~ /main: yes/) main = 1
        if ($i ~ /active keymap:/) {
          split($i, a, ": ")
          keymap = a[2]
        }
      }
      if (main && keymap != "") {
        print keymap
        exit
      }
    }
  ' | xargs
)

# Convert layout name to flag + label
case "$layout" in
  "English (US)") echo "🇺🇸 English" ;;
  "Spanish (Latin American)") echo "🇲🇽 Spanish" ;;
  "Italian") echo "🇮🇹 Italian" ;;
  *) echo "$layout" ;;
esac

