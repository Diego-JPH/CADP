{
   pruebaalumons.pas
   
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


program alumnos;

type
	str20 = string[20];
	
	alumno = record
	codigo : integer;
	nombre : str20;
	promedio : real;
	end;

procedure leer(var alu : alumno);
begin
	writeln('Ingrese el codigo del alumno');
	read(alu.codigo);
	if (alu.codigo <> 0) then begin
		writeln ('Ingrese el nombre del alumno'); 
		readln (alu.nombre);
		writeln ('Ingrese el promedio del alumno'); 
		readln (alu.promedio);
	end;
end;
{ declaración de variables del programa principal }

var a:alumno; contador:integer;

begin
	contador:=0;
	leer (a);
	while (a.codigo <> 0) do begin
		contador:=contador+1;
		leer (a);
	end;
	writeln ('La cantidad de alumnos que se leyeron es: ',contador);
end.
	
