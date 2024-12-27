{
   casamientos.pas
   
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


program casamientos;
type diaA=1..31; mesA=1..12; anioA=1900..2023;
	casamientos_registro=record
		diaB:diaA;
		mesB:mesA;
		anioB:anioA;
	end;
procedure leer (var c:casamientos_registro);
begin
	writeln ('Ingrese anio, mes y dia:');
	readln (c.anioB);
	if (c.anioB = 2019) then begin
		readln (c.mesB);
		readln (c.diaB);
	end;
end;

procedure verano (mes:mesA; var c_verano:integer);
begin
	if (mes <= 3) then
		c_verano:= c_verano+1;
end;

procedure primeros_10 (dias:diaA; var total_10:integer);
begin
	if (dias <= 10) then
		total_10:=total_10+1;
end;

{programa principal}
var casamiento: casamientos_registro;
c_verano, total_10:integer;

BEGIN
	c_verano:=0; total_10:=0;
	leer (casamiento);
	while (casamiento.anioB = 2019) do begin
		verano (casamiento.mesB, c_verano);
		primeros_10 (casamiento.diaB, total_10);
		leer (casamiento);
	end;
	writeln ('Casamientos en verano: ', c_verano);
	write ('Casamientos realizados en los primeros 10 dias de cada mes: ',total_10);
		
END.

