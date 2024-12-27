{
   PUNTO4REPASO.pas
   
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


program maternidad;
Type
	letras=string [30];
	Vpeso=array[1..42] of real;
	lista=^nodo;
	datos=record
		nombre:letras;
		apellido:letras;
		peso:Vpeso;
		dimL:integer;
	end;
	nodo=record
		dato:datos;
		sig:lista;
	end;
procedure leer (var D:datos);
var
	contador:integer; aux:real;
begin
	contador:=0;
	writeln ('Ingrese el nombre (EXIT para finalizar): '); readln (D.nombre);
	if (D.nombre <> 'EXIT') then begin
		writeln ('Ingrese el apellido: '); readln (D.apellido);
		contador:=contador+1;
		writeln ('Ingrese el peso de la semana: ',contador,' (0 para finalizar)'); readln (aux);
		D.peso[contador]:=aux;
		while (contador < 43) and (aux <> 0) do begin
			D.dimL:=contador;
			contador:=contador+1;
			writeln ('Ingrese el peso de la semana: ',contador,' (0 para finalizar)'); readln (aux);
			D.peso[contador]:=aux;
		end;
	end;
end;

procedure cargarLista (var L:lista);
var
	aux:lista;D:datos;
begin
	leer (D);
	while (D.nombre <> 'EXIT') do begin
		new (aux); aux^.dato:=D; aux^.sig:=nil;
		if (L = nil) then begin
			L:=aux;
		end
		else begin
			aux^.sig:=L;
			L:=aux;
		end;
		leer (D);
	end;
end;

procedure analizar_peso (L:lista);
var
	max_semana,total:real; semana,i:integer;
begin
	while (L<>nil) do begin
		max_semana:=0;semana:=0;total:=0;
		for i:=1 to L^.dato.dimL do begin
			total:=total+L^.dato.peso[i];
			if (L^.dato.peso[i] > max_semana) then begin
				max_semana:=L^.dato.peso[i];
				semana:=i;
			end;
		end;
		writeln ('La semana con mayor aumento de peso de: ',L^.dato.nombre,' fue en la semana: ',semana);
		writeln ('El aumento total de peso fue: ',total:0:2);
		L:=L^.sig;
	end;
end;

var
	L:lista;
begin
	L:=nil;
	cargarLista (L);
	analizar_peso (L);
end.
