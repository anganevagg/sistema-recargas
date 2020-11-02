from os import system
recargas = [[],[],[],[]]
companias = ("1.- Telcel", "2.- Movistar", "3.- Unefon", "4.- AT&T")
menuPrincipal = ("1.- Recarga","2.- Reporte de recargas", "3.- Salir")
montos = (10, 20, 50, 100, 150, 200, 500)

def mostrar_menu(arreglo):
    for opcion in arreglo:
        print (opcion)

def validar(mensaje):
    bandera = True
    while bandera:
        try:
            valor = int(input(mensaje))
            bandera = False
        except:
            print ("\nSolamen-te se admiten números".center(50," "))
    return valor

def registrar_recarga():
    print ("\nCompañias\n")
    mostrar_menu(companias)
    compania = validar("\nElija una compañia (1 a 4): ")
    if compania > 0 and compania < 5:
        print ("\nMontos\n")
        mostrar_menu(montos)
        monto = validar("\nIndique el monto que recargó: ")
        if monto in montos:
            recargas[compania - 1].append(monto)
            print ("Recarga registrada")
        else:
            print ("\nMonto no válido")
    else:
        print ("\nOpción no válida")


def mostrar_recargas():
    print ("\nRecargas realizadas")
    for compania in range (0,4):
        print ("\n",companias[compania])
        for recarga in recargas[compania]:
            print (recarga)
        print ("Total: ", sum(recargas[compania]))


eleccion = 1
while eleccion != 3:
    system("clear")
    print ("Centro de recargas Ultra".center(20," "))
    mostrar_menu(menuPrincipal)
    eleccion = validar("\nElija una opción (1 a 3): ")
    system("clear")
    if eleccion == 1:
        registrar_recarga()
    elif eleccion == 2:
        mostrar_recargas()
    elif eleccion == 3:
        print ("\nHasta luego...")
    else:
        print ("Elija una opción válida (1 a 3)")
    input("\nPresione ENTER para continuar")
