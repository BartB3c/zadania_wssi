# Ćwieczenie:

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

C - x i y to współdziadkowie 

D - y jest przybranuym rodzicem x

E - x i y są przybranym rodzeństwem

F - y jest szwagrem x 

G - x i y są kazirodztwem

# Zad 2




