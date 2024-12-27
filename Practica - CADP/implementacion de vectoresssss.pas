{
   implementacion de vectores.pas
   
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


program implementacion;

Type
	Vdatos = array  [1..10] of integer;

procedure leer (var V:Vdatos; var dimL:integer);
var posicion, valor:integer;
begin
	posicion:=0;
	write ('Ingrese un numero entero: ');
	readln (valor);
		while (valor <> 0) and (posicion < 10) do begin
			posicion:=posicion+1;
			V [posicion]:= valor;
			write ('Ingrese un numero entero: ');
			readln (valor);
		end;
		dimL:=posicion;
end;

function ele_max (V:Vdatos; dimL:integer):integer;
var i,max,posicion_max:integer;
begin
	max:=-9999;
	for i:= 1 to dimL do begin
		if (V[i] > max) then begin
			max:= V[i];
			posicion_max:= i;
		end;
	end;
	ele_max:= posicion_max;
end;

function ele_min (V:Vdatos; dimL:integer):integer;
var i,min,posicion_min:integer;
begin
	min:=9999;
	for i:=1 to dimL do begin
		if (V[i] < min) then begin
			min:=V[i];
			posicion_min:=i;
		end;
	end;
	ele_min:= posicion_min;
end;

procedure intercambio (X:integer; Y:integer; var V:Vdatos);
var valor_x, valor_y:integer;
begin
	valor_x:= V[X];
	valor_y:= V[Y];
	V[X]:=valor_y;
	V[Y]:=valor_x;
end;

var V:Vdatos;
	pos_max, pos_min, dimL:integer;

BEGIN
	leer (V, dimL);
	pos_max:= ele_max (V,dimL);
	pos_min:= ele_min (V,dimL);
	intercambio (pos_min,pos_max, V);
	write ('El elemento maximo: ', V[pos_min], ' que se encontraba en la posicion: ', pos_max, ' fue intercambiado con el elemento minimo: ', V[pos_max], ' que se encontraba en la posicion: ', pos_min);
	
END.

