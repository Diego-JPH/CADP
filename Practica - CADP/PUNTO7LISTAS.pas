{
   PUNTO7LISTAS.pas
   
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
program Agencia_Espacial_Europea;
Type 
	rangooo=1..7;
	lista=^nodo;
	lista_si=^nodo;
	lista_no=^nodo;
	
	info=record
		nombre:string;
		duracion:integer;
		construccion:real;
		mantenimiento:real;
		rango:rangooo;
	end;
	
	nodo=record
		dato:info;
		sig:lista;
	end;
	
	Rango=array [1..7] of integer;
	
procedure leer (var i:info);
begin
		writeln ('Ingrese el nombre: ');
		readln (i.nombre);
		writeln ('Ingrese la duracion: ');
		readln (i.duracion);
		writeln ('Ingrese el costo de construccion: ');
		readln (i.construccion);
		writeln ('Ingrese el costo de mantenimiento: ');
		readln (i.mantenimiento);
		writeln ('Ingrese el rango: ');
		readln (i.rango);
end;

procedure agregar (var L:lista; i:info);
var
	aux:lista;
begin
	new (aux);
	aux^.dato:=i;
	aux^.sig:=nil;
	if (L = nil) then begin
		L:=aux;
	end
	else begin
		aux^.sig:=L;
		L:=aux;
	end;
end;

procedure almacenar (var L:lista);
var
	i:info;
begin
	repeat
		leer (i);
		agregar (L,i);
	until (i.nombre = 'GAIA');
end;

procedure a_b (L:lista; var R:Rango; var prom_C:real; var prom_D:real);
var
	max_precio:real; i,C_sondas,suma_meses:integer; suma_const:real; max_nombre:string; aux:real;
begin
	max_precio:=-1; C_sondas:=0; suma_meses:=0; suma_const:=0; aux:=0;
	while (L <> nil) do begin
		C_sondas:=C_sondas+1;
		aux:=L^.dato.construccion + (L^.dato.mantenimiento * L^.dato.duracion);
		if (aux > max_precio) then begin
			max_precio:=aux;
			max_nombre:=L^.dato.nombre;
		end;
		R[L^.dato.rango]:=R[L^.dato.rango]+1;
		suma_meses:=suma_meses+L^.dato.duracion;
		suma_const:=suma_const+L^.dato.construccion;
		L:=L^.sig;
	end;
	prom_C:=suma_meses / C_sondas;
	prom_D:=suma_const / C_sondas;
	writeln ('La sonda mas costosa es: ',max_nombre);
	for i:=1 to 7 do begin
		writeln ('La categoria ',i,' tiene: ',R[i],' sondas');
	end;
end;

procedure c_d (L:lista; p_C:real; p_D:real);
var
	C_supera:integer;
begin
	C_supera:=0;
	while (L <> nil) do begin
		if (L^.dato.construccion > p_D) then
			writeln ('La sonda: ',L^.dato.nombre,' supera el promedio de costo');
		if (L^.dato.duracion > p_C) then
			C_supera:=C_supera+1;
		L:=L^.sig;
	end;
	writeln ('La cantidad de sondas que duran mas que el promedio es: ', C_supera);
end;

procedure criterios (L:lista; var L_si:lista_si; var L_no:lista_no);
var
	aux:real; aux_si:lista_si; aux_no:lista_no;
begin
	while (L <> nil) do begin
		aux:=L^.dato.mantenimiento * L^.dato.duracion;
		if (aux < L^.dato.construccion) and (L^.dato.rango > 1) then begin
			writeln ('La sonda: ',L^.dato.nombre,' cumple con los nuevos criterios H2020');
			new (aux_si);
			aux_si^.dato:=L^.dato;
			aux_si^.sig:=nil;
			if (L_si = nil) then begin
				L_si:=aux_si;
			end
			else begin
				aux_si^.sig:=L_si;
				L_si:=aux_si;
			end;
		end
		else begin
			writeln ('La sonda: ',L^.dato.nombre,' no cumple con los nuevos criterios H2020');
			new (aux_no);
			aux_no^.dato:=L^.dato;
			aux_no^.sig:=nil;
			if (L_no = nil) then begin
				L_no:=aux_no;
			end
			else begin
				aux_no^.sig:=L_no;
				L_no:=aux_no;
			end;
		end;
		L:=L^.sig;
	end;
end;

procedure costos (L:lista; var L_si:lista_si; var L_no:lista_no);
var
	suma:real; proyectos:integer; L2:lista;
begin
	suma:=0; proyectos:=0;
	criterios (L,L_si,L_no);
	L2:=L_no;
	while (L2 <> nil) do begin
		proyectos:=proyectos+1;
		suma:=suma+(L2^.dato.construccion+(L2^.dato.mantenimiento * L2^.dato.duracion));
		L2:=L2^.sig;
	end;
	writeln ('La cantidad de proyectos que no se realizaran son: ',proyectos);
	writeln ('EL costo total de los proyectos que no seran financiados es: ',suma:0:2);
end;
		
var
	L:lista; R:Rango; p_C,p_D:real; L_si:lista_si; L_no:lista_no;
begin
	L:=nil;
	L_si:=nil;
	L_no:=nil;
	almacenar (L);
	a_b (L,R,p_C,p_D);
	c_d (L,p_C,p_D);
	costos (L,L_si,L_no);
end.

