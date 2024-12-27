{
   PUNTO11LISTAS.pas
   
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


program egresados;

Type
	lista=^nodo;
	datos = record
		num:integer;
		apellido:string[30];
		prom:real;
	end;
	nodo = record
		dato:datos;
		sig:lista;
	end;
	puestos=array [1..10] of datos;
	
procedure leer (var D:datos);
begin
	writeln ('Ingrese el numero de alumno: ');
	readln (D.num);
	if (D.num <> 0) then begin
		writeln ('Ingrese el apellido: ');
		readln (D.apellido);
		writeln ('Ingrese el promedio: ');
		readln (D.prom);
	end;
end;

procedure armar_lista (var L:lista);
var
	aux:lista; D:datos;
begin
	leer (D);
	while (D.num <> 0) do begin
		new (aux); aux^.dato:=D; aux^.sig:=nil;
		if (L=nil) then begin
			L:=aux;
		end
		else begin
			aux^.sig:=L;
			L:=aux;
		end;
		leer (D);
	end;
end;

procedure ganadores (L:lista; var V:puestos);
var
	i,T:integer; interruptor:boolean;
begin
	if (L <> nil) then begin
		while (L <> nil) do begin
			interruptor:=true;
				i:=1;
				while (i<=10) and (interruptor = true) do begin
					if (L^.dato.prom > V[i].prom) then begin
						for T:=10 downto i+1 do begin
							V[T]:=V[T-1];
						end;
						V[i]:=L^.dato;
						interruptor:=false;
					end;
					i:=i+1;
				end;
			L:=L^.sig;
		end;
		for T:=1 to 10 do begin
			writeln ('Puesto: ',T,' ',V[T].apellido,' ',V[T].num);
		end;
	end
	else begin
		writeln ('La lista esta vacia');
	end;
end;

var L:lista; V:puestos;
begin
	armar_lista (L);
	ganadores (L,V);
end.

