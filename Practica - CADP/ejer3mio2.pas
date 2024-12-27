{
   ejer3.pas
   
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


program ejer3;


var num1,num2,operacion:real;

BEGIN
writeln('Ingrese 2 numeros reales');
writeln('Ingrese el primer numero');

readln(num1);

readln(num2);

operacion:=(num1 / num2);
writeln('El resultado de dividir ',num1:0:2,' por ',num2:0:2,' es ',operacion:0:2);
	
END.

