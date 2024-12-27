{
   punto1vectoresparte2.pas
   
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


program punto1;

Type
	Vdatos=array [1..500] of integer;
	
procedure cargarVector (var V:Vdatos; var dimL:integer);
var valor:integer;
begin
	dimL:=0;
	write ('Ingrese un numero entero (-1 para finalizar): ');
	readln (valor);
	while ((dimL <= 500) and ( valor <> -1)) do begin
		dimL:=dimL+1;
		V [dimL]:=valor;
		write ('Ingrese un numero entero (-1 para finalizar): ');
		readln (valor);
	end;
end;

procedure busqueda (V:Vdatos; dimL:integer; n:integer; var resultado:boolean);
var posicion:integer;
begin
	resultado:= False; posicion:=1;
	while ((posicion <= dimL) and (resultado = false)) do begin
		if (V[posicion] = n) then begin
			resultado:= True;
		end
		else begin
			posicion:=posicion+1;
		end;
	end;
end;

BEGIN
	
	
END.

