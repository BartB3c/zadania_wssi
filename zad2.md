# Ćwiczenie:

lubi(jan, pawel).

lubi(pawel, krzysztof).

lubi(jan, bartek).

lubi(bartek, jan).

mezczyzna(jan).

kobieta(karolina).

loves(X, Y) :- przyjazn(X, Y) ; \+(przyjazn(X, Z), Z =\= Y).

przyjazn(X, Y) :- lubi(X,Y), lubi(Y,X).

niby_przyjazn(X, Y) :- lubi(X, Y); lubi(Y, X).

nieprzyjazn(X, Y) :- /+lubi(X, Y), /+lubi(y, X).

true_love() :- loves(X, Y), loves(Y, X), ((mezczyzna(X), kobieta(Y)); mezczyzna(Y), kobieta(X))).


# Zad 1

Zad 1.1

A - x i y są rodzeństwem

B - x i y są kuzynostwem

C - x i y to wspólni dziadkowie 

D - y jest przybranym rodzicem x

E - x i y są przybranym rodzeństwem

F - y jest szwagrem x 

G - x i y są kazirodztwem

# Zad 2

rodzic(adam, jan).

rodzic(adam, marian).

rodzic(jakub, tomek).

rodzic(przemek, ania).

rodzic(karolina, maria).

rodzic(zofia, karolina).

rodzic(andrzej, karolina).


mezczyzna(jan).

meczyzna(jakub).

mezczyzna(przemek).

mezczyzna(adam).

mezczyzna(tomek).

osoba(jan).

osoba(jakub).

osoba(przemek).

osoba(adam).

osoba(marian).

osoba(karolina).

osoba(maria).

osoba(ania).

kobieta(X) :- 
    osoba(X),
    /+mezczyzna(X). 

ojciec(X, Y) :- 
    mezczyzna(X), 
    osoba(Y), 
    rodzic(X, Y).

matka(X, Y) :- 
    kobieta(X), 
    osoba(Y), 
    rodzic(X, Y), 
    X \= Y.

corka(X, Y) :- 
    osoba(Y), 
    kobieta(X), 
    rodzic(Y, X).

brat_rodzony(X, Y) :- 
    osoba(X),
    osoba(Y),
    mezczyzna(X),
    rodzic(Z, X),
    rodzic(Z, Y).

brat_przyrodni(X, Y) :-
    mezczyzna(X),
    rodzic(Z, X),
    rodzic(Z, Y),
    rodzic(W, Y),
    /+rodzic(W,X),
    Z \= W.

kuzyn(X, Y) :- 
    mezczyzna(X),
    rodzic(Z, X),
    rodzic(W, Y),
    rodzic(A, W),
    rodzic(A, Z).
    
dziadek_od_strony_ojca(X, Y) :-
    ojciec(X, Z),
    ojciec(Z, Y).

dziadek_od_strony_matki(X, Y) :-
    ojciec(X, Z),
    matka(Z, Y).
   

dziadek(X, Y) :- 
    ojciec(X, Z),
    rodzic(Z,Y).

babcia(X, Y) :-
    matka(X, Z),
    rodzic(Z, Y).

wnuczka(X, Y) :-
    kobieta(Y),
    (dziadek(X,Y) ; babcia(X,Y)).




