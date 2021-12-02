lessOrEqual(X, Y):- X =< Y.

isSorted([]).
isSorted([_]).
isSorted([X, Y|T]):- lessOrEqual(X, Y), isSorted([Y|T]).

psort(L, S):- permutation(L, S), isSorted(S).

min([M], M).
min([H|T], M):- min(T, N), pairMin(H, N, M).

pairMin(A, B, A):- lessOrEqual(A, B).
pairMin(A, B, B):- lessOrEqual(B, A).

remove(X, L, R):- append(A, [X|B], L), append(A, B, R).

selectionSort([], []).
selectionSort([H|T], [M|R]):- min([H|T], M), remove([H|T], M, Q), selectionSort(Q, R).

