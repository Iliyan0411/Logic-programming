removeAll(_, [], []).
removeAll(X, [X|T], ResultList):- removeAll(X, T, ResultList).
removeAll(X, [H|T], [H|R]):- X \= H, removeAll(X, T, R).

remove(X, List, ResultList):- append(A, [X|B], List), append(A, B, ResultList).

permutation([], []).
permutation(L, [X|P]):- remove(X, L, M), permutation(M, P).

reverse([], S, S).
reverse([H|T], Stack, R):- reverse(T, [H|Stack], R).

lessOrEqual(X, Y):- X =< Y.

isSorted([]).
isSorted([_]).
isSorted([X, Y|T]):- lessOrEqual(X, Y), isSorted([Y|T]).


% X списък от числа, Y списък от списъци от числа

% p1(X, Y) <-> Има ел. на Х, който е в ел. на Y.
p1(X, Y):- member(Z, X), member(Y1, Y), member(Z, Y1).

% p2(X, Y) <-> Има ел на Х, който е във всеки ел на Y.
p2(X, Y):- member(Z, X), not(( member(W, Y), not(member(Z, W)) )).

% p3(X, Y) <-> Всеки ел на Х е в ел на Y. AzEtf |=| !Ez!Etf
p3(X, Y):- not(( member(Z, X), not(( member(W, Y), member(Z, W) )) )). 

% p4(X, Y) <-> Всеки ел на Х е във всеки ел на Y. AzAtf |=| !EzEt!f 
p4(X, Y):- not(( member(Z, X), member(W, Y), not(member(Z, W)) )).
