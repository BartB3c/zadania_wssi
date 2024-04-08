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
