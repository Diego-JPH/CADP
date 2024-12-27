{
   asdasdasdas.pas
   
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


program parte2punto3;

var alumnos:string;
	nota,alumnos_8,alumnos_7:integer;

BEGIN
	alumnos_8:=0;
	alumnos_7:=0;
	repeat
		write ('Ingrese el nombre del alumno: ');
		readln (alumnos);
		write ('Ingrese la nota del alumno: ');
		readln (nota);
		if (nota >= 8) then 
			alumnos_8:= alumnos_8+1;
		if (nota = 7) then begin
			alumnos_7:= alumnos_7+1;
		end;
	until (alumnos = 'Zidane Zinedine');
	writeln ('Cantidad de alumnos aprobados con nota 8 o mayor: ',alumnos_8);
	write ('Cantidad de alumnos con nota 7: ', alumnos_7);
	
END.

