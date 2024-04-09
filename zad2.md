# Ćwiczenie
```prolog
lubi(jan, pawel).
lubi(pawel, krzysztof).
lubi(jan, bartek).
lubi(bartek, jan).


mezczyzna(jan).
kobieta(karolina).
mezczyzna(bartek).
mezczyzna(krzysztof).



przyjazn(X, Y) :- 
    lubi(X,Y),
    lubi(Y,X).

niby_przyjazn(X, Y) :-
    lubi(X, Y);
    lubi(Y, X).

nieprzyjazn(X, Y) :-
    \+lubi(X, Y),
    \+lubi(y, X).

loves(X, Y) :- 
    przyjazn(X, Y), 
    \+(przyjazn(X, Z), Z =\= Y).


true_love() :-
    loves(X, Y), 
    loves(Y, X), 
    ((mezczyzna(X), kobieta(Y)); 
    mezczyzna(Y), kobieta(X)).
```
# Zadanie 1.1
A - x i y są rodzeństwem

B - x i y są kuzynostwem

C - x i y to wspólni dziadkowie danego wnuka

D - y jest przybranym rodzicem x

E - x i y są przybranym rodzeństwem

F - y jest szwagrem x

G - x i y to rodzeństwo oraz x jest wujkiem/ciocią y

# Zadanie 1.2


# Zadanie 2
```prolog
osoba(bartek).
osoba(dominik).
osoba(mirek).
osoba(tadek).
osoba(piotrek).
osoba(magda).
osoba(zofia).
osoba(iwona).
osoba(aneta).
osoba(zbyszek).
osoba(hanna).
osoba(bozena).
osoba(zuzanna).

mezczyzna(bartek).
mezczyzna(dominik).
mezczyzna(mirek).
mezczyzna(tadek).
mezczyzna(piotrek).
mezczyzna(zbyszek).

rodzic(hanna, bartek).
rodzic(mirek, bartek).
rodzic(hanna, tadek).
rodzic(hanna, bozena).
rodzic(bozena, zuzanna).
rodzic(zbyszek, piotr).
rodzic(zofia, mirek).
rodzic(bozena, aneta).
rodzic(bozena, iwona).


kobieta(X) :- 
  osoba(X), 
  /+mezczyzna(X).

ojciec(X,Y) :- % X jest ojcem Y
  mezczyzna(X), 
  rodzic(X,Y).

matka(X,Y) :- % X jest matką Y
  kobieta(X), 
  rodzic(X,Y).
  
corka(X,Y) :- % X jest córką Y
  kobieta(X), 
  rodzic(Y,X).

brat_rodzony(X,Y) :- % X jest rodzonym bratem Y
  mezczyzna(X), 
  (ojciec(Z,X), ojciec(Z,Y)),
  (matka(W,X), matka(W,Y)).

brat_przyrodni(X,Y) :- % X jest przyrodnim bratem Y
  mezczyzna(X), 
    (
    	((matka(W,X), matka(W,Y)),	(ojciec(Z,X), \+ojciec(Z,Y)));
    	((matka(W,X), \+matka(W,Y)),	(ojciec(Z,X), ojciec(Z,Y)))
    ).
    
kuzyn(X,Y) :- % X jest kuzynem Y
  mezczyzna(X), 
  rodzic(Z,X), 
  rodzic(W,Y), 
  (rodzic(A,W), rodzic(A,Z)).

dziadek_od_strony_ojca(X,Y) :- % X jest dziadkiem od strony ojca dla Y
  mezczyzna(X),
  ojciec(X,Z), 
  ojciec(Z,Y).

dziadek_od_strony_matki(X,Y) :- % X jest dziadkiem od strony matki dla Y
  mezczyzna(X),
  ojciec(X,Z), 
  matka(Z,Y).

dziadek(X,Y) :- % X jest dziadkiem Y
  mezczyzna(X),
  ojciec(X,Z), 
  rodzic(Z,Y).

babcia(X,Y) :- % X jest babcią Y
  kobieta(X),
  matka(X,Z), 
  rodzic(Z,Y).

wnuczka(X,Y) :- % Y jest wnuczką X
  kobieta(Y), 
  (dziadek(Y,X) ; babcia(Y,X)).

przodek_do2pokolenia_wstecz(X,Y) :- % X jest przodkiem Y do drugiego pokolenia wstecz
  rodzic(X,Y) ; 
  (dziadek(X,Y), babcia(X,Y)).
  
przodek_do3pokolenia_wstecz(X,Y) :- % X jest przodkiem Y do trzeciego pokolenia wstecz
  przodek_do2pokolenia_wstecz(Z,Y),
  rodzic(X,Z).
```
  


