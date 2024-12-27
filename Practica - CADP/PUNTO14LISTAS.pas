{
   PUNTO14LISTAS.pas
   
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
program becas_subsidios;
Type
	codigo=-1..1300; dias=1..31; tipo_transporte=0..5;
	
	Vtransporte=array [0..5] of integer;
	
	datos=record
		cod:codigo;
		dia:dias;
		facultad:string;
		transporte:Vtransporte;
	end;
	
	alumnos=array [1..1300] of datos;
	precios=array [1..5] of real;
	
procedure leer (var D:datos);
var
	aux:tipo_transporte;
begin
	writeln ('Ingrese el codigo de alumno: '); readln (D.cod);
	if (D.cod <> -1) then begin
		writeln ('Ingrese el dia del mes: '); readln (D.dia);
		writeln ('Ingrese la facultad a la que pertenece: '); readln (D.facultad);
		writeln ('Ingrese el/los medio/s de transporte: '); readln (aux);
		while (aux <> 0) do begin
			D.transporte[aux]:=D.transporte[aux]+1;
			writeln ('Ingrese el/los medio/s de transporte: '); readln (aux);
		end;
	end;
end;

procedure cargarVector (var A:alumnos; var dimL:integer);
var
	D:datos;
begin
	dimL:=dimL+1;
	leer (D);
	while (D.cod <> -1) and (dimL < 1300) do begin
		A[dimL]:=D;
		dimL:=dimL+1;
		leer (D);
	end;
	if (dimL = 1300) then
		A[dimL]:=D;
end;


procedure cargarPrecios (var P:precios);
var
	aux:real;
begin
	aux:=0;
	writeln ('Indique el precio actual de viajar en colectivo urbano: '); readln (aux);
	P[1]:=aux;
	writeln ('Indique el precio actual de viajar en colectivo interurbano: '); readln (aux);
	P[2]:=aux;
	writeln ('Indique el precio actual de viajar en tren universitario: '); readln (aux);
	P[3]:=aux;
	writeln ('Indique el precio actual de viajar en tren roca: '); readln (aux);
	P[4]:=aux;
	writeln ('Indique el precio actual de viajar en bicicleta: '); readln (aux);
	P[5]:=aux;
end;
		
procedure viajes_precios_combinaciones (A:alumnos; dimL:integer; P:precios);
var
	condicion_viajes,condicion_bici,condicion_precios,i,t,u,contador,max_1,max_2,t_1,t_2:integer;suma_total:real; VT:Vtransporte;
	flag_1,flag_2:boolean;
	
begin
	condicion_bici:=0; condicion_viajes:=0; condicion_precios:=0; max_1:=0; max_2:=0; t_1:=0; t_2:=0;
	for i:=1 to dimL do begin
		contador:=0;
		suma_total:=0;
		flag_1:=false; flag_2:=false;
		for t:=1 to 5 do begin
			VT[t]:=VT[t]+A[i].transporte[t];
			contador:=contador+A[i].transporte[t];
			if (A[i].transporte[t] > 1) then
				suma_total:=suma_total+(P[t] * A[i].transporte[t]);
			if (A[i].transporte[1] > 1) then
				flag_1:=true;
			if (t > 2) and (A[i].transporte[t] > 1) then
				flag_2:=true;
		end;
		if (contador > 6) then
			condicion_viajes:=condicion_viajes+1;
		if (suma_total > 80) then
			condicion_precios:=condicion_precios+1;
		if (flag_1 = true) and (flag_2 = true) then
			condicion_bici:=condicion_bici+1
	end;
	for u:=1 to 5 do begin
		if (VT[u] > max_1) then begin
			max_2:=max_1;
			t_2:=t_1;
			max_1:=VT[u];
			t_1:=u;
		end
		else begin
			if (VT[u] > max_2) then begin
				max_2:=VT[u];
				t_2:=u;
			end;
		end;
	end;
	writeln ('La cantidad de alumnos que realizan mas de 6 viajes por dia es: ',condicion_viajes);
	writeln ('La cantidad de alumnos que gastan en transporte más de 80$ por día es: ',condicion_precios);
	writeln ('Los dos medios de transporte más utilizados son: ',t_1,' y ',t_2);
	writeln ('La cantidad de alumnos que combinan bicicleta con algun otro medio de transporte: ',condicion_bici);
end;



var
	dimL:integer;
	A:alumnos;
	P:precios;
begin
	dimL:=0;
	cargarVector (A,dimL);
	cargarPrecios (P);
	viajes_precios_combinaciones (A,dimL,P);
end.
	
{esta bien, excepto por el inciso A, pero debio usarse listas, no resuelve el hecho de que sean por dias}
