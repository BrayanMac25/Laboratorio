from tkinter import *
import nmap
import sys
# Definimos una función a ejecutar al clic el botón
def escaner():
    begin = 79
    end = 80
    scanner = nmap.PortScanner()
    target = '192.168.0.1'
    for i in range(begin,end+1): 
        res = scanner.scan(target,str(i))
        res = res['scan'][target]['tcp'][i]['state']
        if res == 'open':
            res = scanner.scan(target,str(i))
            for x,y in res.items():
                print(x,y)
                with open('nmap.csv', 'w') as output:
                    output.write(scanner.csv())
            print(f'port {i} is {res}.')


    input("....")
    input("..")
    input(".")

root = Tk()

# Enlezamos la función a la acción del botón
Button(root, text="Clícame", command=escaner).pack()

root.mainloop() 