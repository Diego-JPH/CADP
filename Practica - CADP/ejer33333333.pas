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

uses SysUtils,math;

var num1,num2,operacion:real;
input: string;

BEGIN
FormatSettings.DecimalSeparator := ',';
writeln('Ingrese 2 numeros reales');
writeln('Ingrese el primer numero');

readln(input);
num1 := StrToFloat(input);

readln(input);
num2 := StrToFloat(input);

operacion:= RoundTo(num1 / num2,-2);
write('El resultado de dividir ',num1,' por ',num2,' es ');
writeln(Format('%0.2f', [operacion]));
	
END.

