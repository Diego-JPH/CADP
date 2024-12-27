{
   PUNTO6LISTAS.pas
   
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


program Agencia_Espacial_Europea;
Type 
	rangooo=1..7;
	lista=^nodo;
	
	info=record
		nombre:string;
		duracion:integer;
		construccion:real;
		mantenimiento:real;
		rango:rangooo;
	end;
	
	nodo=record
		dato:info;
		sig:lista;
	end;
	
	Rango=array [1..7] of integer;
	
procedure leer (var i:info);
begin
		writeln ('Ingrese el nombre: ');
		readln (i.nombre);
		writeln ('Ingrese la duracion: ');
		readln (i.duracion);
		writeln ('Ingrese el costo de construccion: ');
		readln (i.construccion);
		writeln ('Ingrese el costo de mantenimiento: ');
		readln (i.mantenimiento);
		writeln ('Ingrese el rango: ');
		readln (i.rango);
end;

procedure agregar (var L:lista; i:info);
var
	aux:lista;
begin
	new (aux);
	aux^.dato:=i;
	aux^.sig:=nil;
	if (L = nil) then begin
		L:=aux;
	end
	else begin
		aux^.sig:=L;
		L:=aux;
	end;
end;

procedure almacenar (var L:lista);
var
	i:info;
begin
	repeat
		leer (i);
		agregar (L,i);
	until (i.nombre = 'GAIA');
end;

procedure a_b (L:lista; var R:Rango; var prom_C:real; var prom_D:real);
var
	max_precio:real; i,C_sondas,suma_meses:integer; suma_const:real; max_nombre:string; aux:real;
begin
	max_precio:=-1; C_sondas:=0; suma_meses:=0; suma_const:=0; aux:=0;
	while (L <> nil) do begin
		C_sondas:=C_sondas+1;
		aux:=L^.dato.construccion + (L^.dato.mantenimiento * L^.dato.duracion);
		if (aux > max_precio) then begin
			max_precio:=aux;
			max_nombre:=L^.dato.nombre;
		end;
		R[L^.dato.rango]:=R[L^.dato.rango]+1;
		suma_meses:=suma_meses+L^.dato.duracion;
		suma_const:=suma_const+L^.dato.construccion;
		L:=L^.sig;
	end;
	prom_C:=suma_meses / C_sondas;
	prom_D:=suma_const / C_sondas;
	writeln ('La sonda mas costosa es: ',max_nombre);
	for i:=1 to 7 do begin
		writeln ('La categoria ',i,' tiene: ',R[i],' sondas');
	end;
end;

procedure c_d (L:lista; p_C:real; p_D:real);
var
	C_supera:integer;
begin
	C_supera:=0;
	while (L <> nil) do begin
		if (L^.dato.construccion > p_D) then
			writeln ('La sonda: ',L^.dato.nombre,' supera el promedio de costo');
		if (L^.dato.duracion > p_C) then
			C_supera:=C_supera+1;
		L:=L^.sig;
	end;
	writeln ('La cantidad de sondas que duran mas que el promedio es: ', C_supera);
end;

var
	L:lista; R:Rango; p_C,p_D:real;
begin
	L:=nil;
	almacenar (L);
	a_b (L,R,p_C,p_D);
	c_d (L,p_C,p_D);
end.
	
		
	
		
	

