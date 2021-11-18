/*
    maria
      |
    ivan
    /   \
  petar  hristo
    |
  georgi
*/

parent(maria, ivan).
parent(ivan, petar).
parent(ivan, hristo).
parent(petar, georgi).

grandparent(X, Y):- parent(Z, Y), parent(X, Z).

successor(X, Y):- parent(Y, X); (parent(Y, Z), successor(X, Z)).

% List methods
member(X, [X|_]).
member(X, [_|T]):- member(X, T).

first(X, [X|_]).

last(X, [X|[]]).
last(X, [_|T]):- last(X, T).

