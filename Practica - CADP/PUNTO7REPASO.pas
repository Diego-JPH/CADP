{
   PUNTO7REPASO.pas
   
   Copyright 2023 Diego <Diego@DESKTOP-B4BHKKN>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}
program egresados;
Type
	lista=^nodo;
	
	Vnotas = array [1..24] of real;
	
	datos = record
		nro_alum:integer;
		apellido:string;
		nombre:string;
		correo:string;
		anio_ingreso:integer;
		anio_egreso:integer;
		notas:Vnotas;
	end;
	
	nodo = record
		dato:datos;
		sig:lista;
	end;
	
procedure leer (var D:datos);
var
	i,pos,k:integer;
	nota_act:real;
begin
	writeln ('Ingrese el numero de alumno: '); readln (D.nro_alum);
	if (D.nro_alum <> -1) then begin
		writeln ('Ingrese el apellido: '); readln (D.apellido);
		writeln ('Ingrese el nombre: '); readln (D.nombre);
		writeln ('Ingrese el correo: '); readln (D.correo);
		writeln ('Ingrese el anio de ingreso: '); readln (D.anio_ingreso);
		writeln ('Ingrese el anio de egreso: '); readln (D.anio_egreso);
		for i:=1 to 24 do begin
			pos:=1;
			D.notas[i]:=0; {inicializar vector}
			writeln ('Ingrese la nota numero: ',i,':'); readln (nota_act);
			while (nota_act < D.notas[pos]) and (pos < 25) do begin
				pos:=pos+1;
			end;
			D.notas[pos]:=nota_act;
		end;
		for k:=1 to 24 do begin
			writeln ('la nota: ',k,' es: ',D.notas[k]);
		end;
	end;
end;

procedure cargarLista (var L:lista);
var
	aux:lista; D:datos;
begin
	leer (D);
	while (D.nro_alum <> -1) do begin
		new (aux); aux^.dato:=D; aux^.sig:=nil;
		if (L = nil) then begin
			L:=aux;
		end
		else begin
			aux^.sig:=L;
			L:=aux;
		end;
		leer (D);
	end;
end;


procedure cod_impares (cod:integer; anio:integer; var cant_impares:integer); {inicializar cant_impares}
var
	condicion:boolean;
begin
	condicion:=true;
	while (cod > 1) and (anio = 2012) and (condicion = true) do begin
		if (cod mod 2 = 0) then begin
			condicion:=false;
		end
		else begin
			cod:=cod div 10;
		end;
	end;
	if (condicion = true) and (anio = 2012) then
		cant_impares:=cant_impares+1;
end;

procedure recibidos (apellido,nombre,correo:string; anio_i,anio_e:integer; var apellido_1,nombre_1,correo_1:string; var apellido_2,nombre_2,correo_2:string; var max_1,max_2:integer);
begin
	if ((anio_e - anio_i) < max_1) then begin
		apellido_2:=apellido_1;
		nombre_2:=nombre_1;
		correo_2:=correo_1;
		max_2:=max_1;
		apellido_1:=apellido;
		nombre_1:=nombre;
		correo_1:=correo;
		max_1:=anio_e - anio_i;
	end
	else begin
		if ((anio_e - anio_i) < max_2) then begin
			apellido_2:=apellido;
			nombre_2:=nombre;
			correo_2:=correo;
			max_2:=anio_e - anio_i;
		end;
	end;
end;

procedure recorrido (L:lista);
var
	i,cant_impares,max_1,max_2:integer;
	total:real;
	apellido_1,nombre_1,correo_1,apellido_2,nombre_2,correo_2:string;
begin
	if (L <> nil) then begin
		total:=0;
		cant_impares:=0;
		max_1:=0;
		max_2:=0;
		while (L <> nil) do begin
			for i:=1 to 24 do begin
				total:=total+L^.dato.notas[i];
			end;
			writeln ('El promedio de notas obtenido del alumno: ',L^.dato.nro_alum,' es: ',total / 24);
			cod_impares (L^.dato.nro_alum,L^.dato.anio_ingreso,cant_impares);
			recibidos (L^.dato.apellido,L^.dato.nombre,L^.dato.correo,L^.dato.anio_ingreso,L^.dato.anio_egreso,apellido_1,nombre_1,correo_1,apellido_2,nombre_2,correo_2,max_1,max_2);
			L:=L^.sig;
		end;
		writeln ('La cantidad de alumnos ingresantes del anio 2012, cuyo codigo de alumno esta compuesto unicamente por digitos impares es: ',cant_impares);
		writeln ('Los dos alumnos que se recibieron mas rapido son: ',apellido_1,nombre_1,correo_1,' y ',apellido_2,nombre_2,correo_2);
	end
	else begin
		writeln ('La lista esta vacia');
	end;
end;

procedure eliminar (var L:lista);
var
	ant,act:lista;
	nro:integer;
begin
	if (L <> nil) then begin
		ant:=L;
		act:=L;
		writeln ('Ingrese el numero de alumno a eliminar: '); readln (nro);
		while (act^.dato.nro_alum <> nro) and (act <> nil) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (act^.dato.nro_alum = nro) and (act <> nil) then begin
			ant^.sig:=act^.sig;
			dispose (act);
		end
		else begin
			if (act^.dato.nro_alum = nro) and (act = nil) then begin
				ant^.sig:=nil;
				dispose (act);
			end;
		end;
		if (act^.dato.nro_alum <> nro) then
			writeln ('El numero de alumno no fue encontrado');
	end
	else begin
		writeln ('La lista esta vacia');
	end;
end;



var
	L:lista;
begin
	cargarLista (L);
	recorrido (L);
	eliminar (L);
end.
		
		
