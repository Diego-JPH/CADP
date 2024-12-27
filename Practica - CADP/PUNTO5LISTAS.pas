program	 supermercado;
type
	lista=^nodo;
	
	producto = record
		codigo:integer;
		descripcion:string;
		S_actual:integer;
		S_minimo:integer;
		precio:real;
	end;
	
	nodo = record
		dato:producto;
		sig:lista;
	end;
	
procedure leer (var p:producto);
begin
	writeln ('Ingrese el codigo: ');
	readln (p.codigo);
	if (p.codigo <> -1) then begin
		writeln ('Ingrese la descripcion: ');
		readln (p.descripcion);
		writeln ('Ingrese el stock actual: ');
		readln (p.S_actual);
		writeln ('Ingrese el stock minimo: ');
		readln (p.S_minimo);
		writeln ('Ingrese el precio: ');
		readln (p.precio);
	end;
end;

procedure agregar (var L:lista; P:producto);
var 
	aux:lista; L2:lista;
begin
	new(aux);
	aux^.dato:=P;
	aux^.sig:=nil;
	if (L = nil) then begin
		L:=aux;
	end
	else begin
		L2:=L;
		while (L2^.sig <> nil) do begin
			L2:=L2^.sig;
		end;
		L2^.sig:=aux;
	end;
end;

procedure almacenar (var L:lista);
var
	P:producto;
begin
	leer (P);
	while (p.codigo <> -1) do begin
		agregar (L,P);
		leer (P);
	end;
end;

function porcentaje (L:lista):integer;
var
	bajo_stock, cant_p:integer;
begin
	bajo_stock:=0; cant_p:=0;
	while (L <> nil) do begin
		cant_p:=cant_p+1;
		if (L^.dato.S_actual < L^.dato.S_minimo) then 
			bajo_stock:=bajo_stock+1;
		L:=L^.sig;
	end;
	porcentaje:= bajo_stock div cant_p * 100;
end;

procedure descripcion (L:lista);
var
	C,aux:integer;
begin
	while (L <> nil) do begin
		aux:=0;
		C:=L^.dato.codigo;
		while (C > 1) or (aux < 3) do begin
			if (C mod 2 = 0) then
				aux:=aux+1;
			C:= C div 10;
		end;
		if (aux >= 3) then 
			writeln ('Descripcion: ',L^.dato.descripcion);
		L:=L^.sig;
	end;
end;

procedure economicos (L:lista);
var
	P_1,P_2:real; C_1,C_2:longint;
begin
	P_1:=99999; P_2:=99999;
	while (L <> nil) do begin
		if (L^.dato.precio <= P_1) then begin
			P_2:=P_1;
			C_2:=C_1;
			P_1:=L^.dato.precio;
			C_1:=L^.dato.codigo;
		end
		else begin
			if (L^.dato.precio <= P_2) then begin
				P_2:=L^.dato.precio;
				C_2:=L^.dato.codigo;
			end;
		end;
		L:=L^.sig;
	end;
	writeln ('Los dos productos mas baratos son: ',C_1,' (',P_1:0:1,') ',' y ',C_2,' (',P_2:0:1,') ');
end;
	
var
	L:lista;
begin
	L:=nil;
	almacenar (L);
	writeln ('El porcentaje es: ',porcentaje (L),'%');
	descripcion (L);
	economicos (L);
end.
