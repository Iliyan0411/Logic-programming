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
second(Second, [_|T]):- first(Second, T).

last(X, [X|[]]).
last(X, [_|T]):- last(X, T).

append([], Second, Second).
append(First, [], First).
append([X|X1], Second, [X|List]):- append(X1, Second, List).

member1(X, L):- append(_, [X|_], L).

prefix(Prefix, List):- append(Prefix, _, List).
suffix(Suffix, List):- append(_, Suffix, List).
infix(Infix, List):- prefix(X, List), suffix(Infix, X).

remove(X, List, ResultList):- append(A, [X|B], List), append(A, B, ResultList).

remove1(X, [X|T], T).
remove1(X, [H|T], [H|ResultList]):- remove(X, T, ResultList).

