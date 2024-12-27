{
   400facultad.pas
   
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


program facultad_4;
type
	
	
	datos = record
		DNI:integer;
		Apellido:String;
		Nombre:String;
		Anio_nacimiento:integer;
	end;
		
	alumnos = array [1..4] of datos; {cambiar a 400}
	
	
procedure leer (var A:alumnos);
var i:integer; D:datos;
begin
	for i:=1 to 4 do begin {cambiar a 400}
		writeln ('Ingrese el DNI, Apellido, Nombre y fecha de nacimiento del alumno');
		readln (D.DNI);
		readln (D.Apellido);
		readln (D.Nombre);
		read (D.Anio_nacimiento);
		A [i]:= D;
	end;
end;

procedure DNI_par (var porcentaje:real; A:alumnos);
var i, dato, cont_par, cont_impar, suma:integer;
begin
	suma:=0;
	for i:=1 to 4 do begin {cambiar a 400}
		dato:= A [i].DNI;
		cont_par:=0; cont_impar:=0;
		while (dato <> 0) do begin
			if ((dato mod 2) = 0) then begin
				cont_par:=cont_par+1;
				dato:= dato div 10;
			end;
			if ((dato mod 2) = 1) then begin
				cont_impar:=cont_impar+1;
				dato:= dato div 10;
			end;
		end;
		if (cont_par > 0) and (cont_impar = 0) then
			suma:=suma+1;
	end;
	porcentaje:= suma / 4 * 100; {cambiar a 400}
end;

procedure	apellido_nombre (A:alumnos; var apellido_1:string; var nombre_1:string; var apellido_2:string; var nombre_2:string);
var i,edad_1,edad_2:integer;
begin
	edad_1:=3000;edad_2:=3000;
	for i:=1 to 4 do begin {cambiar a 400}
		if A[I].Anio_nacimiento < edad_1 then begin
			edad_2:=edad_1;
			apellido_2:=apellido_1;
			nombre_2:=nombre_1;
			edad_1:= A[i].Anio_nacimiento;
			apellido_1:=A[i].Apellido;
			nombre_1:=A[i].Nombre;
		end
		else begin
			if (A[i].Anio_nacimiento < edad_2) and (A[i].Anio_nacimiento >= edad_1) then begin
				edad_2:=A[i].Anio_nacimiento;
				apellido_2:=A[i].Apellido;
				nombre_2:=A[i].Nombre;
			end;
		end;
	end;
end;
				
var A:alumnos;D:datos;
	apellido_1, apellido_2, nombre_1, nombre_2:string;
	porcentaje_total:real;
			
BEGIN
	leer (A);
	DNI_par (porcentaje_total,A);
	apellido_nombre (A,apellido_1,nombre_1,apellido_2,nombre_2);
	writeln ('El porcentaje de alumnos con DNI compuesto solo por numeros pares es: ',porcentaje_total:0:2);
	writeln ('El apellido de los dos alumnos de mayor edad es: ', apellido_1,' ',nombre_1, ' y ', apellido_2, ' ', nombre_2);
end.

