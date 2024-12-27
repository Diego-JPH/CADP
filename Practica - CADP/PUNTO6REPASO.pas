{
   PUNTO6REPASO.pas
   
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
program observatorio_anio_2015;
Type
	categorias=1..7;
	lista=^nodo;
	datos=record
		cod:integer;
		categoria:categorias;
		nombre:string;
		distancia:real;
		n_descubridor:string;
		anio:integer;
	end;
	nodo=record
		dato:datos;
		sig:lista;
	end;
	
	Vcontador=array [categorias] of integer;
	
procedure cargarVector (var V:Vcontador);
var
	i:integer;
begin
	for i:=1 to 7 do begin
		V[i]:=0;
	end;
end;

procedure leer (var D:datos);
begin
	writeln ('Ingrese el codigo del objeto: '); readln (D.cod);
	if (D.cod <> -1) then begin
		writeln ('Ingrese la categoria (de 1 al 7): '); readln (D.categoria);
		writeln ('Ingrese el nombre del objeto: '); readln (D.nombre);
		writeln ('Ingrese la distancia a la tierra que tiene (en anios luz): '); readln (D.distancia);
		writeln ('Ingrese el nombre del descubridor: '); readln (D.n_descubridor);
		writeln ('Ingrese el anio en el que se descubrio: '); readln (D.anio);
	end;
end;

procedure cargarLista (var L:lista);
var
	aux,L2:lista; D:datos;
begin
	leer (D);
	while (D.cod <> -1) do begin
		new (aux); aux^.dato:=D; aux^.sig:=nil;
		if (L = nil) then begin
			L:=aux;
		end
		else begin
			L2:=L;
			while (L2^.sig <> nil) do begin
				L2:=L2^.sig;
			end;
			L2^.sig:=aux;
		end;
		leer (D);
	end;
end;

procedure mas_lejanos (distancia:real;var max_1,max_2:real; cod_actual:integer;var cod_1,cod_2:integer);
begin
	if (distancia > max_1) then begin
		max_2:=max_1;
		cod_2:=cod_1;
		max_1:=distancia;
		cod_1:=cod_actual;
	end
	else begin
		if (distancia > max_2) then begin
			max_2:=distancia;
			cod_2:=cod_actual;
		end;
	end;
end;

procedure galileo_contador (nombre:string; anio,catego:integer; var contador:integer; var V:Vcontador);
begin
	if (nombre = 'Galileo Galilei') and (anio < 1600) then
		contador:=contador+1;
	V[catego]:=V[catego]+1;
end;

procedure pares_impares (nombre_estrella:string; cod:integer);
var
	pares,impares:integer;
begin
	pares:=0; impares:=0;
	while (cod > 0) do begin
		if (cod mod 2 = 0) then
			pares:=pares+1
		else
			impares:=impares+1;
		cod:=cod div 10;
	end;
	if (pares > impares) then
		writeln ('La estrella: ',nombre_estrella,' posee un codigo con mas digitos pares que impares');
end;

procedure recorrido (L:lista; var V:Vcontador);
var
	cod_1,cod_2,contador,i:integer;
	max_1,max_2:real;
begin
	if (L <> nil) then begin
		max_1:=0; max_2:=0; contador:=0; cod_1:=0; cod_2:=0;
		while (L <> nil) do begin
			mas_lejanos (L^.dato.distancia,max_1,max_2,L^.dato.cod,cod_1,cod_2);
			galileo_contador (L^.dato.n_descubridor,L^.dato.anio,L^.dato.categoria,contador,V);
			pares_impares (L^.dato.nombre,L^.dato.cod);
			L:=L^.sig;
		end;
		writeln ('Los codigos de los dos objetos mas lejanos a la tierra son: ',cod_1,' y ',cod_2);
		writeln ('La cantidad de planetas descubiertos por "Galileo Galilei" antes del anio 1600 son: ',contador);
		for i:=1 to 7 do begin
			writeln ('La cantidad de objetos observados en la categoria: ',i,' son: ',V[i]);
		end;
	end
	else begin
		writeln ('La lista esta vacia');
	end;
end;

var
	L:lista;V:Vcontador;
begin
	L:=nil;
	cargarLista (L);
	recorrido (L,V);
end.
			
			

			
