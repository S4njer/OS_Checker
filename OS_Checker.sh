#!/bin/bash
sudo mkdir /opt/OS_Checker
sudo chown $USER:USER /opt/OS_Checker
helpPanel(){
  echo -e "\n[+] Panel de ayuda:\n"
  echo -e "\t-i: Comprobador OS (Especifica la IP) \n\t\tUso: $0 -i <ip-address>"
  echo -e "\t-s: Enseña todas las direcciones IP junto a su sistema operativo"
  echo -e "\t-d: Borra completamente los logs\n"
}

checkOS ()
{
  if [[ $ipaddress ]]; then
    echo -e "[+] Comprobador de Sistema Operativo"
    (timeout 1 bash -c "ping -c 1 $ipaddress" | grep -oP "ttl=\K\d+") > "/opt/OS_Checker/ttl"
    if [[ $? -eq 0 ]]; then
      if [[ $(cat "ttl") -le "64" ]]; then
        echo -e "[+] $ipaddress --> Linux" | tee -a logs
      elif [[ $(cat "ttl") -le "128" ]]; then
        echo -e "[+] $ipaddress --> Windows" | tee -a logs
      fi
      rm "/opt/OS_Checker/ttl"
    else
      echo -e "[!] No hay conexión con el equipo"
      exit 1
    fi
  else
    echo -e "[!] Uso: $0 -i <ip-address>"
  fi
}


declare -i parameter_counter=0
while getopts "i:hsd" args; do
  case $args in
    i) ipaddress=$OPTARG; let parameter_counter+=1
    ;;
    s) let parameter_counter+=2
    ;;
    d) let parameter_counter+=3
    ;;
    h) 
    ;;
  esac
done

if [[ $parameter_counter -eq 0 ]]; then
  helpPanel
  elif [[ $parameter_counter -eq 1 ]]; then
    checkOS $ipaddress 
  elif [[ $parameter_counter -eq 2 ]]; then
    ls "/opt/OS_Checker/logs" &>/dev/null
    if [[ $? -eq 0 ]]; then
    echo -e "\n[+] All Logs\n--------------\n"
    cat "/opt/OS_Checker/logs" | sort -u
  else
    echo -e "\n[!] No existe ningún log, lance la herramienta con -i\n"
      
    fi
  elif [[ $parameter_counter -eq 3 ]]; then
    ls "/opt/OS_Checker/logs" &>/dev/null
    if [[ $? -eq 0 ]]; then
      echo -e -n "\n[!] Vas a borrar los logs, ¿estás seguro? (y/n) " && read answer
      if [[ $answer == "y" ]]; then
        if [[ $? -eq 0 ]]; then
          rm "/opt/OS_Checker/logs" 2>/dev/null
          echo -e "\n[+] Todos los logs borrados\n"
        fi
      elif [[ $answer == "n" ]]; then
        exit 1
      fi
    else
      echo -e "\n[+] No existe ningún log, saliendo..."
      exit 1
    fi
fi
