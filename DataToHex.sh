#!/bin/bash

cat << "EOF"

  ██████  ▄▄▄     ▓██   ██▓ ███▄ ▄███▓ ▄▄▄       ███▄    █ ▄▄▄█████▓
▒██    ▒ ▒████▄    ▒██  ██▒▓██▒▀█▀ ██▒▒████▄     ██ ▀█   █ ▓  ██▒ ▓▒
░ ▓██▄   ▒██  ▀█▄   ▒██ ██░▓██    ▓██░▒██  ▀█▄  ▓██  ▀█ ██▒▒ ▓██░ ▒░
  ▒   ██▒░██▄▄▄▄██  ░ ▐██▓░▒██    ▒██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒░ ▓██▓ ░ 
▒██████▒▒ ▓█   ▓██▒ ░ ██▒▓░▒██▒   ░██▒ ▓█   ▓██▒▒██░   ▓██░  ▒██▒ ░ 
▒ ▒▓▒ ▒ ░ ▒▒   ▓▒█░  ██▒▒▒ ░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒░   ▒ ▒   ▒ ░░   
░ ░▒  ░ ░  ▒   ▒▒ ░▓██ ░▒░ ░  ░      ░  ▒   ▒▒ ░░ ░░   ░ ▒░    ░    
░  ░  ░    ░   ▒   ▒ ▒ ░░  ░      ░     ░   ▒      ░   ░ ░   ░      
      ░        ░  ░░ ░            ░         ░  ░         ░          
                   ░ ░                                              
                   
                        File Data to Hex
          [+] GitHub : https://github.com/saymant [+]
      [+] Twitter : https://twitter.com/informaticlover [+] 


EOF

let i=0

while [ $i -lt 1  ]
 do
 read -p "Veuillez rentrer un nom de fichier : " bin
 echo
 echo

 xxd -b $bin 2>/dev/nul| cut -c 10- | rev | cut -c 9- | rev > bits.tmp


 if [ -e $bin ]
 then echo "Binaire : "
      echo
      cat bits.tmp

      echo
      echo "Hex : "
      echo
      echo $(echo $(cat bits.tmp | sed -e 's/ /\n/g' | xargs -I{} echo "ibase=2;obase=A;{}" | bc) | sed -e 's/ /\n/g' | xargs -I {} printf "\\\x%02x\n" {}) | sed -e 's/ //g'
      echo

      let i++
  
  else echo "Le fichier n'est pas reconnu :/"
       echo
       echo
       
       rm bits.tmp
  fi
done

rm bits.tmp
