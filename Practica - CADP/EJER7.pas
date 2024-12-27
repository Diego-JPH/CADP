{
   EJER7.pas
   
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


program punto7;

var precioA,precioB,porcen:real;
	cod:integer;
	seguir:boolean;

BEGIN
		
			seguir:= true;
			
			while (seguir) do begin
				writeln ('Ingrese el codigo');
				read (cod);
				if (cod = 32767) then
					seguir:= false
				else begin
				writeln ('Ingrese el precio actual');
				read (precioA);
				writeln ('Ingrese el nuevo precio');
				read (precioB);
				
				porcen:= (precioB - precioA) / precioA * 100;
				if (porcen > 10) then
				writeln ('El aumento de precio del producto ',cod, ' supera el 10%')	
				else    
				writeln ('El aumento de precio del producto ',cod, ' no supera el 10%');
				end;
			end;

END.

