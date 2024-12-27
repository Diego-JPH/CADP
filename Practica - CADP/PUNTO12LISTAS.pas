{
   PUNTO12LISTAS.pas
   
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
program	 desarrolladora_de_juegos;
Type
	android=0..12;
	
	lista=^nodo;
	
	celulares=record
		version:android;
		pantalla:real;
		RAM:integer;
	end;
	
	nodo=record
		dato:celulares;
		sig:lista;
	end;
	
	cantidad=array [1..12] of integer;
	
procedure leer (var C:celulares);
begin
	writeln ('Ingrese la version de Android'); readln (C.version);
	if (C.version <> 0) then begin
		writeln ('Ingrese el tamanio de la pantalla'); readln (C.pantalla);
		writeln ('Ingrese la cantidad de GB de RAM'); readln (C.RAM);
	end;
end;

procedure cargarLista (var L:lista);
var
	C:celulares; aux:lista;
begin
	leer (C);
	while (C.version <> 0) do begin
		new (aux); aux^.dato:=C; aux^.sig:=nil;
		if (L=nil) then begin
			L:=aux;
		end
		else begin
			aux^.sig:=L;
			L:=aux;
		end;
		leer (C);
	end;
end;

procedure cargarVector (L:lista; C:cantidad);
var
	i,contador,cant_celulares:integer;
	suma_total:real;
begin
	contador:=0; suma_total:=0; cant_celulares:=0;
	while (L <> nil) do begin
		C[L^.dato.version]:=C[L^.dato.version]+1;
		if (L^.dato.RAM > 3) and (L^.dato.pantalla >= 5) then begin
			contador:=contador+1;
		end;
		suma_total:=suma_total+L^.dato.pantalla;
		cant_celulares:=cant_celulares+1;
		L:=L^.sig;
	end;
	for i:=1 to 12 do begin
		writeln ('La version de Android: ',i,' tiene: ',C[i],' dispositivos');
	end;
		writeln ('La cantidad  de dispositivos con mas de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas es: ',contador);
		writeln ('El tamanio promedio de las pantallas de todos los dispositivos es: ',suma_total / cant_celulares:0:2);
end;

var
	L:lista;
	C:cantidad;
begin
	cargarLista (L);
	cargarVector (L,C);
end.

