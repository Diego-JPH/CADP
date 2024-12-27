{
   transportepractica2vectores.pas
   
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


program transporte;

Type 
	dias=1..31;
	
	datos=record
		dia:dias;
		dinero:integer;
		km:integer;
	end;
		
	Vdatos=array [1..200] of datos;
	Vdias=array [1..31] of integer;
	
		
procedure leer (var D:datos);
begin
	write ('Ingrese en KM: ');
	readln (D.km);
	if (D.km > 0) then begin
		write ('Ingrese el dia: ');
		readln (D.dia);
		write ('Ingrese el monto de dinero: ');
		readln (D.dinero);
	end;
end;

procedure cargarVector (var D:datos; var V:Vdatos; var dimL:integer);
begin
	dimL:=1;
	while ((dimL < 200) and (D.km <> 0)) do begin {no va a leer el numero 200}
		V[dimL]:=D;
		leer (D);
		dimL:=dimL+1;
	end;
end;

procedure analisis (D:datos; V:Vdatos; var prom:integer; dimL:integer; VD:Vdias);
var i,min_km, min_dia,y, suma:integer; min:real;
begin
	suma:=0;min:=9999;
	for i:=1 to dimL do begin
		suma:=suma+V[i].dinero;
		if (V[i].dinero < min) then begin
			min_dia:=V[i].dia;
			min_km:=V[i].km;
			min:=V[i].dinero;
		end;
		if ((V[i].dia >= 1) and (V[i].dia <=31)) then
			VD [V[i].dia]:= VD [V[i].dia]+1;
	end;
	writeln ('El monto promedio es: ', suma div dimL);
	writeln ('La distancia y dia del mes que se transporto menos dinero es: ',min_km,' y ',min_dia);
	for y:=1 to 31 do begin
		write ('Los viajes realizados el dia: ',y,' fueron: ',VD[y]);
	end;
end;

procedure eliminar (var D:datos; var V:Vdatos; var dimL:integer);
var i,y:integer;
begin
	for i:=1 to dimL do begin
		if (V[i].km = 100) then begin
			for y:=i to (dimL-1) do begin
				V[i]:=V[i+1];
			end;
			dimL:=dimL-1;
		end;
	end;
end;
			

var D:datos; V:Vdatos; dimL,prom:integer; VD:Vdias;

BEGIN
	leer (D);
	cargarVector (D,V,dimL);
	analisis (D,V,prom,dimL,VD);
	eliminar (D,V,dimL);
END.

