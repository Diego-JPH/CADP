{
   pruebalista.pas
   
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


program ejemploListas;
type
    lista = ^nodo;
    nodo = record
        dato: integer;
        sig: lista;
    end;
    
procedure imprimirLista(l:lista);
begin
    while (l <> nil) do begin
        write(l^.dato, ' ');
        l:= l^.sig;
    end;
    writeln();
end;

var 
    l,aux: lista;
    num:integer;
begin
  readln(num);
  while (num <> -1) do begin
    // agregar adelante
    new(aux);
    aux^.dato:= num;
    aux^.sig:= l;
    l:= aux;
    
    readln(num);
  end;
  imprimirLista(l);
end.

