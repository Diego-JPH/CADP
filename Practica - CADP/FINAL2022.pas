{
   FINAL2022.pas
   
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
program final2022;
Type
	cate=1..5;
	informacion = record
		DNI:integer;
		nombre:string;
		apellido:string;
		categoria:cate;
	end;
	participantes = array [1..5000] of informacion; {SE DISPONE} {PREGUNTAR SI SE DISPONE DE UNA DIML}
	Vcontador = array [cate] of integer;
	lista = ^nodo;
	nodo = record
		dato:informacion;
		sig:lista;
	end;
	
procedure inicializarVector (var V:Vcontador);
var
	i:integer;
begin
	for i:=1 to 5 do begin
		V[i]:=0;
	end;
end;

procedure contador (var V:Vcontador; P:participantes;var dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		V[P[i].categoria]:=V[p[i].categoria]+1;
	end;
end;

procedure cargarLista (var L:lista; V:Vcontador; P:participantes; dimL:integer);
var
	aux:lista;
	i:integer;
begin
	for i:=1 to dimL do begin
		if (V[P[i].categoria] <= 50) then begin
			new (aux); aux^.dato:=P[i]; aux^.sig:=nil;
			if (L = nil) then begin
				L:=aux;
			end
			else begin
				aux^.sig:=L;
				L:=aux;
			end;
		end;
	end;
end;

procedure cargarDatos (var P:participantes;var dimL:integer);
var
	continuar:string;
begin
	writeln('Desea ingresar participantes? (S/N)'); readln(continuar);
	while (continuar = 'S') do begin
		dimL:=dimL+1;
		writeln('Ingrese el DNI: '); readln(P[dimL].DNI);
		writeln('Ingrese el nombre: '); readln(P[dimL].nombre);
		writeln('Ingrese el apellido: '); readln(P[dimL].apellido);
		writeln('Ingrese la categoria a la que pertenece: '); readln(P[dimL].categoria);
		writeln('Desea continuar ingresando participantes? (S/N)'); readln(continuar);
	end;
end;

procedure imprimirLista (L:lista);
begin
	if (L <> nil) then begin
		writeln ('La lista esta cargada');
		while (L <> nil) do begin
			writeln(L^.dato.nombre);
			L:=L^.sig;
		end;
	end;
end;

var
	L:lista; P:participantes; V:Vcontador; dimL:integer;
begin
	L:=nil; dimL:=0;
	inicializarVector(V);
	cargarDatos(P,dimL);
	contador(V,P,dimL);
	cargarLista (L,V,P,dimL);
	imprimirLista(L);
end.
