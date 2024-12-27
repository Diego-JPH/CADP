{
   punterossss.pas
   
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


program punteros;
type
cadena = string[50];
puntero_cadena = ^cadena;
var
pc: puntero_cadena;
begin
writeln(sizeof(pc), ' bytes');
new(pc);
writeln(sizeof(pc), ' bytes');
pc^:= 'un nuevo nombre';
writeln(sizeof(pc), ' bytes');
writeln(sizeof(pc^), ' bytes');
pc^:= 'otro nuevo nombre distinto al anterior';
writeln(sizeof(pc^), ' bytes');
end.

