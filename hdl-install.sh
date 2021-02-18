#!/usr/bin/env zsh

ps2_install () {
for file in *;
do
  if [[ "${file##*.}" == "iso" ]]; then
      #Get titles and inject dvds
      echo "Found ${file}"
      echo "Enter title for ${file}"
      read title
      echo "Transfering iso ${file}"
      sudo hdl-dump inject_dvd /dev/sdi $title $file
      echo "Done transfering ${file}!"
  fi
done
}

#Transfer art
art_install () {
  echo "Transfering art..."
  touch pfs2.txt
  cat pfs.txt >> pfs2.txt
  for img in *;
  do
    if [[ "${img##*.}" == "png" ]] || [[ "${img##*.}" == "jpg" ]]; then
        echo "put $img" >> pfs2.txt
    fi
  done
  echo exit >> pfs2.txt
  sudo pfsshell < pfs2.txt
  rm pfs2.txt

echo "Done transfering art!"
}

clear

echo "Welcome to hdl-install!"

while : ; do
  echo "What would you like to do?"
  echo "1. Install PS1 VCD(s)"
  echo "2. Install PS2 DVD(s)"
  echo "3. Install ART"
  echo "4. Exit"
  printf "\nPlease enter the number of your selection: "

  read sel

  echo "\n"

  case $sel in

    1)
      clear
      echo "ps1 TODO\n"
      ;;
    2)
      ps2_install
      #clear
      echo "ps2\n"
      ;;
    3)
      clear
      art_install
      ;;
    4)
      clear
      exit 0
    ;;
    *)
      clear
      echo "Unrecognized command\n"
      ;;
  esac

done
