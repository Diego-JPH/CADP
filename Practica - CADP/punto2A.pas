{
   punto2A.pas
   
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


program punto2A;

var i,num_max,num,i_max,posicion:integer;

BEGIN
	i:= 1;
	i_max:= 0;
	num_max:=0;
	for i:= 1 to 10 do begin
		writeln ('Ingrese el numero');
		read (num);
		i_max:= i_max+1;
		if (num > num_max) then begin
			num_max:= num;
			posicion:= i_max;
		end;
	end;
	write ('El mayor numero leido fue el: ', num_max, ', en la posicion: ', posicion);

	
	
END.

