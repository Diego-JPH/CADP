{
   PUNTO1REPASO.pas
   
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
program productora;
Type
	codigo=1..5;
	lista=^nodo;
	info=record
		DNI:longint; {por si acaso el integer se queda corto}
		apellido:string;
		nombre:string;
		edad:integer;
		cod:codigo;
	end;
	nodo=record
		dato:info;
		sig:lista;
	end;
	Vcod=array [codigo] of integer;
	
procedure leer (var I:info);
begin
	writeln ('Ingrese el DNI: '); readln (I.DNI);
	writeln ('Ingrese el apellido: '); readln (I.apellido);
	writeln ('Ingrese el nombre: '); readln (I.nombre);
	writeln ('Ingrese la edad: '); readln (I.edad);
	writeln ('Ingrese el codigo de genero de actuacion: '); readln (I.cod);
end;

procedure cargarLista (var L:lista);
var
	aux:lista;I:info;
begin
	repeat
		leer (I);
		new (aux); aux^.dato:=I; aux^.sig:=nil;
		if (L=nil) then begin
			L:=aux;
		end
		else begin
			aux^.sig:=L;
			L:=aux;
		end;
	until (I.DNI=33555444);
end;

procedure pares_impares_codigos (L:lista);
var
	V:Vcod;
	i,par,impar,DNI_aux,contador,max_1,max_2,cod_1,cod_2:integer;
begin
	contador:=0; max_1:=0; max_2:=0; cod_1:=0; cod_2:=0;
	while (L<>nil) do begin
		par:=0; impar:=0; DNI_aux:=L^.dato.DNI;
		while (DNI_aux>0) do begin
			if (DNI_aux mod 2 = 0) then begin
				par:=par+1;
			end
			else begin
				impar:=impar+1;
			end;
			DNI_aux:=DNI_aux div 10;
		end;
		V[L^.dato.cod]:=V[L^.dato.cod]+1;
		if (par > impar) then
			contador:=contador+1;
		L:=L^.sig;
	end;
	for i:=1 to 5 do begin
		if (V[i] > max_1) then begin
			max_2:=max_1;
			cod_2:=cod_1;
			max_1:=V[i];
			cod_1:=i;
		end
		else begin
			if (V[i] > max_2) then begin
				max_2:=V[i];
				cod_2:=i;
			end;
		end;
	end;
	writeln ('La cantidad de personas cuyo DNI tien mas digitos pares que impares es: ',contador);
	writeln ('Los dos codigos de genero mas elegidos son: ',cod_1,' y ',cod_2);
end;

procedure eliminar (var L:lista; D:integer);
var
	L2,ant,act:lista;
begin
	if (L^.dato.DNI = D) then begin
		L2:=L;
		L:=L^.sig;
		dispose (L2);
	end
	else begin
		ant:=L; act:=L;
		while (act^.dato.DNI <> D) and (act <> nil) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (act^.dato.DNI = D) then begin
			ant^.sig:=act^.sig;
			dispose (act);
		end
		else begin
			writeln ('El DNI no existe');
		end;
	end;
end;

var
	L:lista;
	D:integer;
begin
	L:=nil;
	cargarLista (L);
	pares_impares_codigos (L);
	writeln ('Ingrese el DNI que quiere eliminar: '); readln (D);
	eliminar (L,D);
end.
