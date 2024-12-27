{
   PUNTO2REPASO.pas
   
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
program aseguradora;
Type
	codigo=1..6;

	lista=^nodo;
	
	datos=record
		cod_cliente:integer;
		DNI:integer;
		apellido:string;
		nombre:string;
		cod:codigo;
		monto_mensual:real;
	end;
	
	nodo=record
		dato:datos;
		sig:lista;
	end;
	
	Vtabla=array [1..6] of real;
	
procedure leer (var D:datos);
begin
	writeln ('Ingrese el codigo de cliente: '); readln (D.cod_cliente); 
	writeln ('ingrese el DNI: '); readln (D.DNI);
	writeln ('Ingrese el apellido: '); readln (D.apellido);
	writeln ('Ingrese el nombre: '); readln (D.nombre);
	writeln ('Ingrese el codigo de poliza: '); readln (D.cod);
	writeln ('Ingrese el monto mensual que el cliente paga: '); readln (D.monto_mensual);
end;

procedure cargarLista (var L:lista);
var
	D:datos; aux:lista;
begin
	repeat
		leer (D);
		new (aux); aux^.dato:=D; aux^.sig:=nil;
		if (L = nil) then begin
			L:=aux;
		end
		else begin
			aux^.sig:=L;
			L:=aux;
		end;
	until (D.cod_cliente = 1122)
end;

procedure tabla (var V:Vtabla);
var
	i:integer;
	aux:real;
begin
	for i:=1 to 6 do begin
		writeln ('Ingrese el monto adicional para la poliza: ',i);
		readln (aux);
		V[i]:=aux;
	end;
end;
	
procedure a_b (L:lista; V:Vtabla);
var
	contador,DNI_aux:integer;
begin
	while (L <> nil) do begin
		contador:=0;
		writeln ('El cliente: ',L^.dato.DNI,' ',L^.dato.apellido,' ',L^.dato.nombre,' paga mensualmente (con la poliza): ',L^.dato.monto_mensual+V[L^.dato.cod]);
		DNI_aux:=L^.dato.DNI;
		while (DNI_aux > 0) and (contador < 2) do begin {MUY IMPORTANTE APRENDERLO}
			if (DNI_aux mod 10 = 9) then
				contador:=contador+1;
			DNI_aux:=DNI_aux div 10;
		end;
		if (contador >=2) then	
			writeln ('El cliente: ',L^.dato.apellido,' ',L^.dato.nombre,' cumple con que su DNI tiene almenos dos digitos 9');
		L:=L^.sig;
	end;
end;	

procedure eliminar (var L:lista; cod_eliminar:integer);
var
	ant,act:lista;
begin
	ant:=L; act:=L;
	while (act^.dato.cod_cliente <> cod_eliminar) do begin
		ant:=act;
		act:=act^.sig;
	end;
	ant^.sig:=act^.sig;
	dispose (act);
end;
	

var
	cod_eliminar:integer;
	L:lista;
	V:Vtabla;
begin
	cargarLista (L);
	tabla (V);
	a_b (L,V);
	writeln ('Ingrese el codigo de cliente que quiera eliminar: '); readln (cod_eliminar);
	eliminar (L,cod_eliminar);
end.
		
