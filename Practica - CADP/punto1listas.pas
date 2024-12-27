{
   punto1listas.pas
   
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


program JugamosConListas;
type
	lista = ^nodo;
	
	nodo = record
	num : integer;
	sig : lista;
end;

procedure armarNodo(var L: lista; v: integer);
var
	aux : lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := L;
	L := aux;
end;

procedure imprimirLista (L:lista);
begin
	while (L <> nil) do begin
		write (L^.num, ' ');
		L:=L^.sig;
	end;
end;

procedure sumar (L:lista; dato:integer);
begin
	while (L <> nil) do begin
		L^.num:=L^.num+dato;
		L:=L^.sig;
	end;
end;

function multiplos (L:lista; dato:integer):integer;
var
	contador:integer;
begin
	contador:=0;
	while (L <> nil) do begin
		if (L^.num mod dato = 0) then
			contador:= contador+1;
		L:= L^.sig;
	end;
	multiplos:= contador;
end;


procedure sublista (L:lista;A,B:integer; var L_nueva:lista);
var
	aux:lista; interruptor:boolean;
begin
	if (L <> nil) then begin
		interruptor:=true;
		while (L <> nil) and (interruptor = true) do begin
			if (L^.num > A) and (L^.num < B) then begin
				new (aux);
				aux^.num:=L^.num;
				aux^.sig:=nil;
				if (L_nueva = nil) then begin
					L_nueva:=aux;
				end
				else begin
					aux^.sig:=L_nueva;
					L_nueva:=aux;
				end;
			end
			else begin
				if (L^.num > B) then
					interruptor:=false;
			end;
			L:=L^.sig;
		end;
	end;
end;
	


var
	pri,alt_lista:lista;
	valor,dato,A,B : integer;
	
begin
	alt_lista:=nil;
	pri := nil;
	A:=5;
	B:=7;
	write('Ingrese un numero: ');
	readln (valor);
	while (valor <> 0) do begin
		armarNodo(pri, valor);
		write('Ingrese un numero: ');
		readln (valor);
	end;
	write ('Ingrese el multiplo: ');
	readln (dato);
	writeln ('los multiplos de ',dato,' son: ',multiplos (pri,dato));
	sublista (pri,A,B,alt_lista);
end.
