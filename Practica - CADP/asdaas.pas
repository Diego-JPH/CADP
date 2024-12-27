{
   asdaas.pas
   
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


program punto4;

const	max_num = 9999;

var  num,min1,min2:integer;

BEGIN
	min1:=max_num;
	min2:=max_num;
	repeat
		write ('Ingrese el numero: ');
		read (num);
		if (num < min1) then begin
			min2:=min1;
			min1:=num;
		end;
		if (num < min2) and (num > min1) then begin
			min2:=num;
		end;
	until (num = 0);
	write ('Los dos numeros minimos son: ',min1, ' y ', min2);
		
	
	
END.

