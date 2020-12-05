#!/bin/bash
nmap 192.168.157.128 > resultados.txt
ejec= $?
if [[ $ejec==0 ]] ;
then
    python send.py
else echo "Error"

fi
