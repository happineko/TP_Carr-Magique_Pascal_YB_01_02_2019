//ALGORITHME : CarreMagique2
//BUT : Realiser un carre magique
//ENTREE :
//SORTIE : Le carre magique

program cmagic;

uses crt;

const
	// Change la taille de tableau (nombres impairs uniquement)
	tsize = 25;

var
	t:array[1..tsize,1..tsize] of integer;
	i,j,lo,La : integer;
	
procedure CheckOOB;
begin
	if (lo > tsize) then
	begin
		lo:= 1;
	end;
	if (La < 1) then
	begin
			La:=tsize;
	end;
end;

procedure CheckCell;
begin
	if (t[lo,La] <> 0) then
		begin
			La := La-1;
			if (La = 0) then
			begin
				La:=tsize;
			end;
			if (La = -1) then
			begin
				La:=tsize-3;
			end;
			lo:=lo-1;
			t[lo,La] := i;
		end;
		
		if (t[lo,La] = 0) then
		begin		
			t[lo,La] := i;
		end;
end;

Procedure Initialise;
begin
	for i:=1 to tsize do
	begin
		for j:=1 to tsize do
		begin
			T[j,i] := 0;
		end;
	end;
end;

Procedure Ecriture;
begin
	for i:=1 to tsize do
	begin
		for j:=1 to tsize do
		begin
			if t[j,i] < 10 then
			begin
				write('|   ');
				write(T[j,i]);
			end;
			
			if (t[j,i] >= 10) AND (t[j,i] < 100) then
			begin
				write('|  ');
				write(T[j,i]);
			end;
			
			if (t[j,i] >= 100) AND (t[j,i] < 1000) then
			begin
				write('| ');
				write(T[j,i]);
			end;
			
			if (t[j,i] >= 1000) then
			begin
				write('|');
				write(T[j,i]);
			end;
			
			
		end;
		writeln();
	end;
end;
BEGIN
	clrscr;
	textcolor(green);
	//Coordonnees du 1er chiffre
	lo := (tsize div 2) +1;
	La := (tsize div 2);
	
	// Initialise le tableau avec des 0
	Initialise;	
	
	//Place le 1er chiffre
	t[lo,La] := 1;
	for i:=2 to (tsize*tsize) do
	begin
		//on change les valeurs pour se deplacer au 'Nord Est'
		lo := lo+1;
		La := La-1;
		
		//On verifie si les valeurs restent dans le tableau
		CheckOOB;	
		
		//On verifie si l'emplacement de la case est 'vide' soit different de 0
		//autrement on change les valeurs pour faire un deplacement de deux cases vers le 'Nord'
		CheckCell;
		
		//Ce cas veut dire qu'on a atteint le coin superieur droit
		if (lo=tsize) and (LA=1) then
		begin
			lo := tsize-1;
			LA := tsize;
		end;
	end;		
	Ecriture;
	readln();
END.
