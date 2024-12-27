program punto8;
var caracter:char;
	i,vocales,no_vocales:integer;
	
begin
	vocales:=0;
	no_vocales:= 0;
	i:= 1;
	for i:= 1 to 3 do begin
		write('Ingrse caracter: ');
		readln(caracter);
		case caracter of
			'a': vocales:= vocales+1;
			'e': vocales:= vocales+1;
			'i': vocales:= vocales+1;
			'o': vocales:= vocales+1;
			'u': vocales:= vocales+1;
		else
		no_vocales:= no_vocales+1
		end;
	end;
	if (vocales=3) then
		writeln ('Los tres son vocales')
	else
		writeln ('Al menos un caracter no es vocal');

end.

