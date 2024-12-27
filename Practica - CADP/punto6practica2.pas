{
   punto6practica2.pas
   
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


program punto6;

procedure leer (var precio:real; var codigo:string; var tipo:string);
begin
	writeln ('Ingrese el precio, codigo y tipo: ');
	readln (precio);
	readln (codigo);
	readln (tipo);
end;
procedure minimos (precio:real; codigo: string; var min1,min2:string);
var precio1, precio2:real;
begin
	precio1:=9999; precio2:=9999;
	if (precio < precio1) then begin
		min2:=min1;
		min1:=codigo;
		precio2:= precio1;
		precio1:= precio;
	end;
	if (precio > precio1) and (precio < precio2) then begin
			min2 := codigo;
			precio2:= precio;
	
	end;
end;
procedure pantalon (codigo:string; precio:real; var p_max:string);
var max_precio:real;
begin
	max_precio:=-9999;
	if (precio > max_precio) then begin
		max_precio:= precio;
		p_max:= codigo;
	end;
end;
procedure promedio (precio:real; var suma_total:real; var prendas:integer);

begin
	suma_total:=suma_total+precio;
	prendas:=prendas+1;
end;
var precio, suma, promedio_total:real;
	codigo, min1, min2, p_max, tipo:string;
	i, prendas:integer;
	
BEGIN
	For i:= 1 to 2 do begin
		leer (precio, codigo, tipo);
		minimos (precio,codigo, min1, min2);
		if (tipo = 'pantalon') then begin;
			pantalon (codigo, precio, p_max);
		end;
		promedio (precio, suma, prendas);
	end;
	promedio_total:=suma / prendas;
	writeln ('Los dos productos mas baratos son: ', min1, ' y ', min2);
	writeln ('El pantalon mas caro es: ',p_max);
	write ('El precio promedio es: ', promedio_total:0:2);

	
END.

