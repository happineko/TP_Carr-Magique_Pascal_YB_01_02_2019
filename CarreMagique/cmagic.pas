//ALGORITHME : CarreMagique
//BUT : Realiser un carre magique
//ENTREE :
//SORTIE : Le carre magique
{
CONSTANTES : 
	tsize <-- 5 (ou n'importe quel nombre impair)

VAR :
	t:TABLEAU[1..tsize, 1..tsize] DE ENTIER
	i,j,lo,La : ENTIER

DEBUT
	lo := (tsize div 2) +1
	La := (tsize div 2)
	
	// Initialise le tableau avec des 0
	POUR i DE 1 A tsize FAIRE
		POUR j DE 1 A tsize FAIRE
			T[j,i] <--  0
		FINPOUR
	FINPOUR	
	
	//Place le 1er chiffre
	t[lo,La] <-- 1
	POUR i DE 2 A (tsize*tsize) FAIRE
		//on change les valeurs pour se deplacer au 'Nord Est'
		lo <-- lo+1
		La <-- La-1
		
		//On verifie si les valeurs restent dans le tableau
		SI (lo > tsize) ALORS
			lo<-- 1
		FINSI
		SI (La < 1) ALORS
			La<--tsize
		FINSI	
		
		//On verifie si l'emplacement de la case est 'vide' soit different de 0 
		//autrement on change les valeurs pour faire un deplacement de deux cases vers le 'Nord'
		SI (t[lo,La] <> 0) ALORS
			La <-- La-1
			SI (La = 0) ALORS
				La<--tsize
			FINSI
			SI (La = -1) ALORS
				La<--tsize-3
			FINSI
			lo<--lo-1
			t[lo,La] <-- i
		FINSI
		
		SI (t[lo,La] = 0) ALORS
			t[lo,La] <-- i
		FINSI
		
		//Ce cas veut dire qu'on a atteint le coin superieur droit
		SI (lo=tsize) ET (LA=1) ALORS
			lo <-- tsize-1
			LA <-- tsize
		FINSI
	FINPOUR	
	
	POUR i DE 1  A  tsize FAIRE
		POUR j DE 1  A  tsize FAIRE
			SI t[j,i] < 10 ALORS
				ECRIRE('|  ')
				ECRIRE(T[j,i])
			FINSI
			
			SI t[j,i] >= 10  ET  t[j,i] < 100 ALORS
				ECRIRE('| ')
				ECRIRE(T[j,i])
				
			SI t[j,i] >= 100 ALORS
				ECRIRE('|')
				ECRIRE(T[j,i])
			FINSI
		FINPOUR
	FINPOUR
FIN
}
program cmagic;

uses crt;

const
	// Change la taille de tableau (nombres impairs uniquement)
	tsize = 101;

var
	t:array[1..tsize,1..tsize] of integer;
	i,j,lo,La : integer;
BEGIN
	clrscr;
	//Coordonnees du 1er chiffre
	lo := (tsize div 2) +1;
	La := (tsize div 2);
	
	// Initialise le tableau avec des 0
	for i:=1 to tsize do
	begin
		for j:=1 to tsize do
		begin
			T[j,i] := 0;
		end;
	end;	
	
	//Place le 1er chiffre
	t[lo,La] := 1;
	for i:=2 to (tsize*tsize) do
	begin
		//on change les valeurs pour se deplacer au 'Nord Est'
		lo := lo+1;
		La := La-1;
		
		//On verifie si les valeurs restent dans le tableau
		if (lo > tsize) then
		begin
			lo:= 1;
		end;
		if (La < 1) then
		begin
			La:=tsize;
		end;	
		
		//On verifie si l'emplacement de la case est 'vide' soit different de 0 
		//autrement on change les valeurs pour faire un deplacement de deux cases vers le 'Nord'
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
		
		//Ce cas veut dire qu'on a atteint le coin superieur droit
		if (lo=tsize) and (LA=1) then
		begin
			lo := tsize-1;
			LA := tsize;
		end;
	end;		
	
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
	readln();
END.
