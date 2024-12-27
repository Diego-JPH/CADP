{
   regisyvectores.pas
   
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


program regisyvectores;
Type
	Vdatos = array [0..1000] of integer
	
	digitos = record
		cero:integer;
		uno:integer;
		dos:integer;
		tres:integer;
		cuatro:integer;
		cinco:integer;
		seis:integer;
		siete:integer;
		ocho:integer;
		nueve:integer;
	end;
	
procedure leer (V:Vdatos, var dimL:integer);
var valor,contador:integer;
begin
	contador:=0;
	write ('Ingrese un numero entero: ');
	readln (valor);
	while (valor <> -1) and (contador <= 999) do begin
		V [contador]:=valor;
		contador:=contador+1
		write ('Ingrese un numero entero: ');
		readln (valor);
	end;
	dimL:=contador;
end;

procedure ocurrencias_por_digito (V:Vdato; var D:digitos; dimL;
var i,dato:integer;
begin
	for i:=1 to dimL do begin
		dato:= V [i];
		if ((dato mod 

BEGIN
	
	
END.

