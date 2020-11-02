recargas=[[],[],[],[]]
Companias=["1.- Telcel", "2.- Movistar", "3.- Unefon", "4.- AT&T"]
Montos=[10, 20, 50, 100, 150, 200, 500]
Menu_principal =["1.- Recarga","2.- Reporte de recargas", "3.- Salir"]

def sum(vector)
	res=0
	if vector==[]
		return 0
	else
		vector.each { |i| res+=i}
		return res
	end
end

def mostrar_menu(list)
	list.each {|i| puts i }
end

def validar(mensaje)
	i=gets.to_i
	while i==0
		puts mensaje
		i=gets.to_i
		if i==0
			puts "\nSolamente se admiten números"
		end
	end
	return i
end

def registrar_recarga(recargas)
	print("\nCompañias\n")
	mostrar_menu(Companias)
	compania=validar("\nIndique el monto que recargó: ")
	if compania > 0 and compania<5
		print("\nMontos\n")
		mostrar_menu(Montos)
		monto=validar("\nIndique el monto que recargó: ")
		flag=false
		Montos.each do |i|
			if monto==i
				flag=true
			end
		end
		if flag
			recargas[compania-1].push(monto)
			puts "Recarga registrada"
		else
			puts "\nMonto no válido"
		end
	end
end

def mostrar_recargas(companias, recargas)
	puts "\nRecargas realizadas"
	for compania in (0..3)
		puts "\n#{companias[compania]}"
		for recarga in (0..recargas[compania].length-1)
			puts recargas[compania][recarga]
		end
		puts "Total #{sum(recargas[compania])}"
	end
end

eleccion=0
while eleccion!=3
	puts `clear`
	puts "Centro de recargas Ultra"
	mostrar_menu(Menu_principal)
	eleccion=validar("\nElija una opción (1 a 3): ")
	puts `clear`
	if eleccion==1
		registrar_recarga(recargas)
	elsif eleccion==2
		mostrar_recargas(Companias, recargas)
	elsif eleccion==3
		puts "\nHasta luego..."
	else
		puts "Elija una entrada válida (1 a 3)"
	end
	print("\nPresione ENTER para continuar")
	gets
end
