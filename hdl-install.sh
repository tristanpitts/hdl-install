#!/usr/bin/env zsh

for file in *;
do
  if [[ "${file##*.}" == "iso" ]]; then
      #Get title and inject dvd
      #echo "Enter title for ${file}"
      #read title
      #sudo hdl-dump inject_dvd /dev/sdi $title $file
      #echo "Done writing iso!"
      #Transfer art
      echo "Transfering art..."
      sudo pfsshell
      #pfs shell commands
      device /dev/sdi
      mount +OPL #mount specific partition on ps2 hdd
      cd ART #changes directory on the hdd
      dir=pwd
      lcd ${dir} #lcd controls which directory on the host machine we are currently in
      for img in *;
      do
        if [[ "${file##*.}" == "png" ]] || if [[ "${file##*.}" == "jpg" ]]; then
          put $img #put filename transfers a file to the hdd from the computer
        fi
      done
      exit #exit pfsshell
      echo "Done!"
  fi
done
