{
   parte2 punto1 A.pas
   
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


program punto1a;

var numeros,i,mayores_5,resultado:integer;

BEGIN
	resultado:=0;
	mayores_5:=0;
	for i:= 1 to 10 do begin
		writeln ('Ingrese los numeros');
		read (numeros);
		resultado:=resultado+numeros;
		if (numeros > 5) then begin
			mayores_5:= mayores_5+1;
		end;
		 
	end;
	writeln ('La suma total del los numeros es: ',resultado);
	write ('La cantidad de numeros mayores a 5 es: ', mayores_5);

END.

