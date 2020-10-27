#!/bin/bash
md5sum < fcfm.png fcfm.png mystery_img1.txt mystery_img2.txt msg.txt > checksumdesc.txt
chek1=$(<checksum.txt)
chek2=$(<cheksumdesc.txt)
if [ a==b ];
then 
    echo "Se han validado los checksum"
    base64 < msg.txt > codmsg.txt
    echo "msg.txt se ha codificado a codmsg.txt"
    base64 < fcfm.png > codfcfm.txt
    echo "fcfm.png se ha codificado a codfcfm.txt"
    echo "Se comenzara a decodificar"
    base64 -d < mystery_img1.txt > decodimg1.png
    base64 -d < mystery_img2.txt > decod2img2.png
    echo "Se han decodificado los archivos"
    echo "Se ha terminado la ejecucion"
else
    echo "Los datos no son correctos"
fi
