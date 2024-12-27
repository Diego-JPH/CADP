{
   escuelas.pas
   
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


program escuelas;
type 
	escuela = record
		CUE:string;
		establecimiento:string;
		docentes:integer;
		alumnos:integer;
	end;
	
procedure leer (var dato:escuela);
begin
	writeln ('Ingrese el CUE, nombre del establecimiento, cantidad de docentes y cantidad de alumnos');
	readln (dato.CUE);
	readln (dato.establecimiento);
	readln (dato.docentes);
	readln (dato.alumnos);
end;

procedure relacion (a:integer; d:integer; var result_relacion:real);
begin
	result_relacion:= a / d;
end;

procedure mejores (dato_CUE:string; dato_establecimiento:string; relacion:real; var relaMAX_1:real; var relaMAX_2:real; var CUEMAX_1:string; var establecimientoMAX_1:string; var CUEMAX_2:string; var establecimientoMAX_2:string);
begin
	if (relacion < relaMAX_1) then begin
		relaMAX_2:= relaMAX_1;
		CUEMAX_2:= CUEMAX_1;
		establecimientoMAX_2:= establecimientoMAX_1;
		CUEMAX_1:= dato_CUE;
		establecimientoMAX_1:= dato_establecimiento;
		relaMAX_1:= relacion;
	end
	else if (relacion < relaMAX_2) and (relacion >= relaMAX_1) then begin
		relaMAX_2:= relacion;
		CUEMAX_2:= dato_CUE;
		establecimientoMAX_2:= dato_establecimiento;
	end;
end;

procedure rela_escuelas (a:integer; d:integer; var suma_escuelas:integer);
var rela:real;
begin
	rela:= a / d;
	if (rela > 23.435) then
		suma_escuelas:= suma_escuelas+1;
end;
		
var e:escuela;
	result_relacion:real;
	CUEMAX1, CUEMAX2, ESTMAX1, ESTMAX2:string;
	relaMAX_1, relaMAX_2:real;
	suma_escuelas_excedidas, i:integer;
	

BEGIN
	suma_escuelas_excedidas:=0; relaMAX_1:=999; relaMAX_2:=999;
	for i:= 1 to 5 do begin
	leer (e);
	relacion (e.alumnos, e.docentes, result_relacion);
	mejores (e.CUE, e.establecimiento, result_relacion, relaMAX_1, relaMAX_2, CUEMAX1, ESTMAX1, CUEMAX2, ESTMAX2);
	rela_escuelas (e.alumnos, e.docentes, suma_escuelas_excedidas);
	end;
	writeln ('Cantidad de escuelas excedidas de alumnos en relacion por docentes: ',suma_escuelas_excedidas);
	writeln ('Las dos mejores escuelas en relacion entre docentes y alumnos son: ',CUEMAX1, ' ',ESTMAX1, ' y ',CUEMAX2, ' ', ESTMAX2);
	
END.

