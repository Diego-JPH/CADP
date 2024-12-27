{
   PARCIAL2022.pas
   
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
program	 PARCIAL2022;
Type
	notas=4..10; turnos=1..4; clases=1..12;
	Vcontador=array [clases] of integer;
	lista=^nodo;
	datos=record
		DNI:integer;
		nombre:string;
		apellido:string;
		nota:notas;
		turno:turnos;
		clases:Vcontador;
	end;
	nodo=record
		dato:datos;
		sig:lista;
	end;
	Valumnos_en_condicion=array [turnos] of integer;
	
procedure aptos_rendir (L:lista;var L2:lista);
var
	aux:lista;contador,i:integer;
begin
	if (L <> nil) then begin
		while (L <> nil) do begin
			contador:=0;
			for i:=1 to 12 do begin
				contador:=contador+L^.dato.clases[i];
			end;
			if (contador >= 8) then begin
				new (aux); aux^.dato:=L^.dato; aux^.sig:=nil;
				if (L2 = nil) then begin
					L2:=aux;
				end
				else begin
					aux^.sig:=L2;
					L2:=aux;
				end;
			end;
			L:=L^.sig;
		end;
	end
	else begin
		writeln ('La lista esta vacia');
	end;
end;

procedure analizar_DNI (DNI:integer;var contador:integer);
var
	condicion:boolean;
begin
	condicion:=false;
	while (DNI >= 1) and (condicion = false) do begin
		if (DNI mod 10 = 0) then
			condicion:=true;
		DNI:=DNI div 10;
	end;
	if (condicion = false) then
		contador:=contador+1;
end;
			

procedure cargarVector (var V:Valumnos_en_condicion);
var
	i:integer;
begin
	for i:=1 to 4 do begin
		V[i]:=0;
	end;
end;

procedure imprimir (L2:lista; var V:Valumnos_en_condicion);
var
	contador,i,max,turno_max:integer;
begin
	if (L2 <> nil) then begin
		contador:=0; max:=-1; turno_max:=0;
		while (L2 <> nil) do begin
			if (L2^.dato.nota >= 8) then
				writeln ('El alumno: ',L2^.dato.apellido,' ',L2^.dato.nombre,' ',L2^.dato.DNI,' obtuvo una nota igual o mayor a 8');
				V[L2^.dato.turno]:=V[L2.dato.turno]+1;
			analizar_DNI (L2^.dato.DNI,contador);
			L2:=L2^.sig;
		end;
		for i:=1 to 4 do begin
			if (V[i] > max) then begin
				max:=V[i];
				turno_max:=i;
			end;
		end;
		writeln ('El turno con mayor cantidad de alumnos en condiciones de rendir el examen es: ',turno_max);
		writeln ('La cantidad de alumnos que no poseen ningun digito 0 en su DNI es: ',contador);
	end
	else begin
		writeln ('La lista esta vacia');
	end;
end;

var
	L,L2:lista;
	V:Valumnos_en_condicion;
begin
	L2:=nil;
	L:= {se supone ya cargado por la consigna}
	aptos_rendir (L,L2);
	cargarVector (V);
	imprimir (L2,V);
end.
			

		

