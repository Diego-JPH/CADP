{
   MULTINACIONAL4X4.pas
   
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


program multinacional;
Type
	codigo_E=1..2000; codigo_P=1..25;
	datos = record
		cod:codigo_E;
		cod_p:codigo_P;
		antiguedad:integer;
		sueldo:real;
	end;
	empleados = array [1..2000] of datos;
	paises = array [1..25] of integer;
	sueldos = array [1..25] of real;
	
procedure leer (var D:datos);
begin
	writeln ('Ingrese el codigo de empleado'); readln (D.cod);
	writeln ('Ingrese el codigo del pais'); readln (D.cod_p);
	writeln ('Ingrese la antiguedad'); readln (D.antiguedad);
	writeln ('Ingrese el sueldo bruto'); readln (D.sueldo);
end;

procedure cargarVector (var V:empleados; var dimL:integer);
var
	D:datos;
begin
	dimL:=dimL+1;
	leer (D);
	while (D.cod <> 1) and (dimL<2000) do begin
		V[dimL]:=D;
		dimL:=dimL+1;
		leer (D);
	end;
	V[dimL]:=D;	
end;

procedure pais_max (V:empleados; P:paises; dimL:integer);
var
	i,T,max,aux:integer;
begin
	for i:=1 to dimL do begin
		P[V[i].cod_p]:=P[V[i].cod_p]+1;
	end;
	max:=0;
	for T:=1 to 25 do begin
		if (P[T] > max) then begin
			max:=P[T];
			aux:=T;
		end;
	end;
	writeln ('El pais con mayor cantidad de empleados es: ',aux);
end;

procedure antiguedad_sueldos (V:empleados; dimL:integer);
var
	max,i:integer;
begin
	max:=0;
	for i:=1 to dimL do begin
		if (V[i].antiguedad >= 10) and (V[i].sueldo < 1500) then begin
			max:=max+1;
		end;
	end;
	writeln ('La cantidad de empleados de mas de 10 anios y cuyo sueldo bruto no alcanza los 1500 dolares es: ',max);
end;

procedure sueldos_paises (V:empleados; dimL:integer; S:sueldos; P:paises);
var	
	i,T:integer;
begin
	for i:=1 to dimL do begin
		if (V[i].sueldo > S[V[i].cod_p]) then begin
			S[V[I].cod_p]:=V[i].sueldo;
			P[V[i].cod_p]:=V[i].cod;
		end;
	end;
	for T:=1 to 25 do begin
		writeln ('El pais con el codigo: ',T,' tiene como empleado mejor pagado a: ',P[T]);
	end;
end;

var
	V:empleados; dimL:integer; P:paises; S:sueldos;
begin
	dimL:=0;
	cargarVector (V,dimL);
	pais_max (V,P,dimL);
	antiguedad_sueldos (V,dimL);
	sueldos_paises (V,dimL,S,P);
end.
