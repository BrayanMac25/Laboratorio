#!/bin/bash
echo "Introduce la ip local a la que quieras hacer el nmap de vulnerabilidad "
read ip
namp --script vuln $ip > nmaplocal.txt
echo "Introduce la ip publica para hacer un nmap de vulnerabilidad " 
read ippub
nmap --script vuln $ippub > nmappublica.txt
base64 < nmaplocal.txt > mapcod.txt
base64 < nmappublica.txt> mapcodp.txt
echo "Los archivos estan en la carpeta"



