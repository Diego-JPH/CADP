{
   punto2parte2.pas
   
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


program punto5;

const maximo = 9999;

var num, max_num, min_num, suma:integer;

BEGIN
	max_num:=0; suma:=0; min_num:=maximo;
	write ('Ingrese el numero: ');
	read (num);
	while (num <> 100) do begin
		suma:= suma + num;
		if (num > max_num) then begin
			max_num:= num;
		end;
		if (num < min_num) then begin
			min_num:= num;
		end;
		write ('Ingrese el numero: ');
		read (num);
	end;
	writeln ('El numero maximo leido es: ',max_num);
	writeln ('El numero minimo leido es: ',min_num);
	write ('La suma total de los numeros leidos es: ',suma);
END.

