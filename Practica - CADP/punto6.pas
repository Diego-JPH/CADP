{
   punto6.pas
   
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

var leg,cant_alum,alum_6_5,alum_8_5:integer;
	prom:real;

BEGIN
	cant_alum:=0;
	alum_6_5:=0;
	alum_8_5:=0;
	write ('Ingresar legajo:' );
	read(leg);
	while(leg <> -1) do begin
		write ('Ingresar promedio:' );
		readln(prom);
		cant_alum:= cant_alum+1;
		if (prom > 6.5) then begin
			alum_6_5:= alum_6_5+1;
		end;
		if (prom > 8.5) and (leg < 2500) then begin;
			alum_8_5:= alum_8_5+1;
		end;
		write ('Ingresar legajo:' );
		read (leg);
	end;
	writeln ('La cantidad de alumnos es:', cant_alum);
	writeln ('Cantidad de alumnos con promedio mayor a 6.5:', alum_6_5);
	writeln ('Porcentaje de alumnos destacados:', (alum_8_5 * 100 / cant_alum):0:2, '%');
	
END.

