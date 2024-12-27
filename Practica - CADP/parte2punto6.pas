{
   parte2punto6.pas
   
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


program practica2punto6;

procedure lectura;
var num,max_num:integer;
begin
	max_num:=-1;
	write ('Ingrese el numero: ');
	read (num);
	while (num > 0) do begin
		if (num mod 2 = 0) and (num > max_num) then begin
			max_num := num;
		end;
		write ('Ingrese el numero: ');
		read (num);
	end;
	write ('El numero par mas alto fue: ',max_num);
end;
	
BEGIN
	lectura;
	
END.

