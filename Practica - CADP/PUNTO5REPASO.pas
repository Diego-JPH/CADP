{
   PUNTO5REPASO.pas
   
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
program empresa_transporte;
Type
	codigos=1..100;
	camion=record
		patente:string;
		anio_fabricacion:integer;
		capacidad:real;
	end;
	Vcamiones=array [codigos] of camion;
	lista=^nodo;
	datos=record
		cod_viaje:integer;
		cod_camion:codigos;
		KM:real;
		destino:string;
		anio_viaje:integer;
		DNI:integer;
	end;
	nodo=record
		dato:datos;
		sig:lista;
	end;
	
procedure leer (var D:datos);
begin
	writeln ('Ingrese el codigo de viaje: '); readln (D.cod_viaje);
	if (D.cod_viaje <> -1) then begin
		writeln ('Ingrese el codigo del camion: '); readln (D.cod_camion);
		writeln ('Ingrese la distancia en kilometros recorrida: '); readln (D.KM);
		writeln ('Ingrese la ciudad de destino: '); readln (D.destino);
		writeln ('Ingrese el anio en que se realizo el viaje: '); readln (D.anio_viaje);
		writeln ('Ingrese el DNI del chofer: '); readln (D.DNI);
	end;
end;

procedure cargarLista (var L:lista);
var
	aux:lista; D:datos;
begin
	leer (D);
	while (D.cod_viaje <> -1) do begin
		new (aux); aux^.dato:=D; aux^.sig:=nil;
		if (L=nil) then begin
			L:=aux;
		end
		else begin
			aux^.sig:=L;
			L:=aux;
		end;
		leer (D);
	end;
end;

procedure patentes (KM:real;patente:string;var p_1,p_2:string;var max,min:real);
begin
	if (KM > max) then begin
		max:=KM;
		p_1:=patente;
	end
	else begin
		if (KM < min) then begin
			min:=KM;
			p_2:=patente;
		end;
	end;
end;

procedure choferes_DNI (DNI:integer;cod:integer);
var
	condicion:boolean;
begin
	condicion:=false;
	while (DNI > 0) and (condicion = false) do begin
		if (DNI mod 2 = 0) then
			condicion:=true
		else
			DNI:=DNI div 10
	end;
	if (condicion = false) then
		writeln ('El viaje con el codigo: ',cod,' tiene un chofer cuyo DNI solo contiene digitos impares');
end;

procedure recorrido (L:lista;V:Vcamiones);
var
	p_1,p_2:string;
	max,min:real;
	contador:integer;
begin
	if (L <> nil) then begin
		max:=-1; min:=9999; contador:=0;
		while (L <> nil) do begin
			patentes (L^.dato.KM,V[L^.dato.cod_camion].patente,p_1,p_2,max,min);
			if (V[L^.dato.cod_camion].capacidad > 30.5) and ((L^.dato.anio_viaje - V[L^.dato.cod_camion].anio_fabricacion) > 5) then
				contador:=contador+1;
			choferes_DNI (L^.dato.DNI,L^.dato.cod_viaje);
			L:=L^.sig;
		end;
		writeln ('La patente del camion que mas KM recorrio es: ',p_1);
		writeln ('La patente del camion que menos KM recorrio es: ',p_2);
		writeln ('La cantidad de camiones que poseen una capacidad mayor a 30.5 y una antiguedad mayor a 5 anios al momento del viaje es: ',contador);
	end;
end;

var
	L:lista;
	V:Vcamiones;
begin
	L:=nil;
	V {se supone ya cargada por consigna}
	cargarLista	(L);
	recorrido (L,V);
end.
