{
   PUNTO3REPASO.pas
   
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
program remiseria;
Type
	lista=^nodo;
	
	viajes=record
		viaje:integer;
		cod_auto:integer;
		d_origen:string;
		d_destino:string;
		KM:real;
	end;
	
	nodo=record
		dato:viajes;
		sig:lista;
	end;

	
procedure leer (var V:viajes);
begin
	writeln ('Ingrese el numero de viaje: (-1 para finalizar)'); readln (V.viaje);
	if (V.viaje <> -1) then begin
		writeln ('Ingrese el codigo del auto: (ingresar de manera ordenada) '); readln (V.cod_auto);
		writeln ('Ingrese la direccion de origen: '); readln (V.d_origen);
		writeln ('Ingrese la direccion de destino: '); readln (V.d_destino);
		writeln ('Ingrese los KM recorridos durante el viaje: '); readln (V.KM);
	end;
end;

procedure cargarListas (var L:lista);
var
	V:viajes;
	aux,L2:lista;
begin
	leer (V);
	while (V.viaje <> -1) do begin
		new (aux); aux^.dato:=V; aux^.sig:=nil;
		if (L=nil) then begin
			L:=aux;
		end
		else begin
			L2:=L;
			while (L2^.sig <> nil) do begin
				L2:=L2^.sig;
			end;
			L2^.sig:=aux;
		end;
		leer (V);
	end;
end;

procedure mas_kilometros_recorridos (L:lista);
var
	max_1,max_2:real;
	cod_1,cod_2:integer;
begin
	max_1:=-1; max_2:=-1;
	cod_1:=0; cod_2:=0;
	while (L <> nil) do begin
		if (L^.dato.KM > max_1) then begin
			max_2:=max_1;
			cod_2:=cod_1;
			max_1:=L^.dato.KM;
			cod_1:=L^.dato.cod_auto;
		end
		else begin
			if (L^.dato.KM > max_2) then begin
				max_2:=L^.dato.KM;
				cod_2:=L^.dato.cod_auto;
			end;
		end;
		L:=L^.sig;
	end;
	writeln ('Los dos autos que mas KM recorrieron fueron: ',cod_1,' y ',cod_2);
end;



procedure nueva_lista (L:lista; var L2:lista);
var
	aux,aux_L2:lista;
begin
	while (L <> nil) do begin
		if (L^.dato.KM > 5) then begin
			new (aux); aux^.dato:=L^.dato; aux^.sig:=nil;
			if (L2 = nil) then begin
				L2:=aux;
			end
			else begin
				aux_L2:=L2;
				while (aux_L2^.sig <> nil) do begin
					aux_L2:=aux_L2^.sig;
				end;
				aux_L2^.sig:=aux;
			end;
			writeln ('El viaje con origen en: ',L^.dato.d_origen,' y destino en: ',L^.dato.d_destino,' siendo el viaje numero: ',L^.dato.viaje,' recorrio mas de 5 KM');
		end;
		L:=L^.sig;
	end;
	
end;
				

var
	L,L2:lista;
begin
	cargarListas (L);
	mas_kilometros_recorridos (L);
	nueva_lista	(L,L2);
end.
		

				
			
			
