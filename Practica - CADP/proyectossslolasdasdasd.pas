{
   proyectos.pas
   
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


program proyectos;

Type 
	identidad = record
		DNI:integer;
		nombre:string;
		apellido:string;
		email:string;
	end;
	proyecto = record
		codigo:integer;
		titulo:string;
		docente:identidad;
		alumnos:integer;
		n_escuela:string;
		localidad:string;
	end;
	
procedure leer_d (var i:identidad);
begin
	write ('Ingrese el DNI: '); readln (i.DNI);
	write ('Ingrese el nombre: '); readln (i.nombre);
	write ('Ingrese el apellido: '); readln (i.apellido);
	write ('Ingrese el Email: '); readln (i.email);
end;

procedure leer (var d:proyecto);
begin
	write ('Ingrese el codigo en numeros: '); 
	readln (d.codigo);
	if (d.codigo <> -1) then begin
		write ('Ingrese el titulo: '); 
		readln (d.titulo);
		writeln ('Registre al docente');
		leer_d (d.docente);
		write ('Ingrese la cantidad de alumnos: '); 
		readln (d.alumnos);
		write ('Ingrese el nombre de la escuela: '); 
		readln (d.n_escuela);
		write ('Ingrese la localidad: '); 
		readln (d.localidad);
	end;
end;

procedure esc_localidad (l:string; var l_max:string; var cant:integer);
begin
	if (l = l_max) then begin
		cant:= cant+1;
		l_max:= l;
	end
	else begin
		writeln ('Escuelas por localidad: ',cant);
	end;
end;

procedure esc_max (a:integer; n:string; var max_1:integer; var max_2:integer; var nom_1:string; var nom_2:string);
begin
	if (a > max_1) then begin
		max_2:= max_1;
		nom_2:= nom_1;
		max_1:= a;
		nom_1:= n;
	end
	else begin
		if (a > max_2) and (a <= max_1) then begin
			max_2 := a;
			nom_2:= n;
		end;
	end;
end;

procedure p_daireaux (l:string; c:integer; t:string);
var cant_p, cant_i:integer;
begin
	cant_p:= 0; cant_i:= 0;
	if (l = 'Daireaux') then begin
		while (c > 0) do begin
			if (( c mod 2) = 0) then begin
				cant_p:= cant_p+1;
			end
			else begin
				cant_i:= cant_i+1;
			end;
			c:= c div 10;
		end;
		if (cant_p = cant_i) then 
		writeln ('Titulo: ',t);
	end;
	
end;
	
var p:proyecto;
	l_max, nom_1, nom_2:string;
	cant, max_1, max_2, total_esc:integer;

BEGIN
	cant:= 0; max_1:= -1; max_2:= -1; total_esc:= 0;
	leer (p);
	l_max:= p.localidad;
	while (p.codigo <> -1) do begin
		total_esc:= total_esc+1;
		esc_localidad (p.localidad, l_max, cant);
		esc_max (p.alumnos, p.n_escuela, max_1, max_2, nom_1, nom_2);
		if (p.localidad = 'Daireaux') then
			p_daireaux (p.localidad, p.codigo, p.titulo);
		leer (p);
	end;
	writeln ('La cantidad de escuelas participes es: ', total_esc);
	writeln ('Las dos escuelas con mayor cantidad de alumnos participes son: ',nom_1, ' y ', nom_2);
	
END.

