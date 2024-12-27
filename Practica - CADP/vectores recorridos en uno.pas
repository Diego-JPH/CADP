{
   vectores recorridos en uno.pas
   
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
	Vdatos = array  [0..9] of integer;

procedure leer (var V:Vdatos; var dimL:integer);
var posicion, valor:integer;
begin
	posicion:=0;
	write ('Ingrese un numero entero: ');
	readln (valor);
		while (valor <> 0) and (posicion <= 9) do begin
			V [posicion]:= valor;
			write ('Ingrese un numero entero: ');
			readln (valor);
			posicion:=posicion+1;
		end;
		dimL:=posicion;
end;

procedure ele_max_min (var max:integer; var min:integer; V:Vdatos; dimL:integer);
var i,max_n,min_n,pos_max,pos_min:integer;
begin
	min_n:= 9999; max_n:=-9999;
	for i:=1 to dimL do begin
		if (V[I] < min_n) then begin
			min_n:= V[i];
			pos_min:= i;
		end
		else begin
			if (V[i] > max_n) then begin
			max_n:= V[i];
			pos_max:=i;
			end;
		end;
	end;
	max:=pos_max;
	min:=pos_min;
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
	ele_max_min (pos_max, pos_min, V, dimL);
	intercambio (pos_min,pos_max, V);
	write ('El elemento maximo: ', V[pos_min], ' que se encontraba en la posicion: ', pos_max, ' fue intercambiado con el elemento minimo: ', V[pos_max], ' que se encontraba en la posicion: ', pos_min);
	
END.
