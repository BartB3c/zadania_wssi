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

kobieta(X) :- osoba(X), /+mezczyzna(X).

ojciec(X, Y) :- mezczyzna(X), osoba(Y), rodzic(X, Y).

matka(X, Y) :- kobieta(X), osoba(Y), rodzic(X, Y), X = Y.

corka(X, Y) :- osoba(Y), kobieta(X), rodzic(Y, X).

brat_rodzony(X, Y) :- osoba(X), osoba(Y), mezczyzna(X), rodzic(Z, X), rodzic(Z, Y).

brat_przyrodni(X, Y) :- mezczyzna(X), rodzic(Z, X), rodzic(Z, Y), rodzic(W, Y), /+rodzic(W,X), Z = W.

kuzyn(X, Y) :- mezczyzna(X), rodzic(Z, X), rodzic(W, Y), rodzic(A, W), rodzic(A, Z).

dziadek_od_strony_ojca(X, Y) :- ojciec(X, Z), ojciec(Z, Y).

dziadek_od_strony_matki(X, Y) :- ojciec(X, Z), matka(Z, Y).

dziadek(X, Y) :- ojciec(X, Z), rodzic(Z,Y).

babcia(X, Y) :- matka(X, Z), rodzic(Z, Y).

wnuczka(X, Y) :- kobieta(Y), (dziadek(X,Y) ; babcia(X,Y)).

przodek_do2pokolenia_wstecz(X, Y) :- rodzic(X, Z), rodzic(Z, Y),

przodek_do3pokolenia_wstecz(X, Y) :- rodzic(X, Z), przodek_do2pokolenia_wstecz(Z, Y).

















