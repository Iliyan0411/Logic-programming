lessOrEqual(X, Y):- X =< Y.

isSorted([]).
isSorted([_]).
isSorted([X, Y|T]):- lessOrEqual(X, Y), isSorted([Y|T]).

psort(L, S):- permutation(L, S), isSorted(S).

min([M], M).
min([H|T], M):- min(T, N), pairMin(H, N, M).

pairMin(A, B, A):- lessOrEqual(A, B).
pairMin(A, B, B):- not(lessOrEqual(A, B)).

remove(X, L, R):- append(A, [X|B], L), append(A, B, R).

selectionSort([], []).
selectionSort([H|T], [M|R]):- min([H|T], M), remove([H|T], M, Q), selectionSort(Q, R).

splitByPivot(Pivot, [H|T], [H|A], B):- lessOrEqual(H, Pivot), splitByPivot(Pivot, T, A, B).
splitByPivot(Pivot, [H|T], A, [H|B]):- not(lessOrEqual(H, Pivot)), splitByPivot(Pivot, T, A, B).

quickSort([Pivot|T], S):-
    splitByPivot(Pivot, T, A, B),
    quickSort(A, SA),
    quickSort(B, SB),
    append(SA, [Pivot|SB], S).

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
treeSort(L, SL):- makeTree(L, T), leftRootRight(T, SL).

makeTree([], empty).
makeTree([H|T], Tree):- makeTree(T, Tree1), add(H, Tree1, Tree).

add(X, empty, tree(empty, X, empty)).
add(X, tree(LT, Root, RT), tree(LT1, Root, RT)):- lessOrEqual(X, Root), add(X, LT, LT1).
add(X, tree(LT, Root, RT), tree(LT, Root, RT1)):- not(lessOrEqual(X, Root)), add(X, RT, RT1).

leftRootRight(empty, []).
leftRootRight(tree(LT, Root, RT), L):- leftRootRight(LT, LL), leftRootRight(RT, RL), append(LL, [Root|RL], L).


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mylength([], 0).
mylength([_|T], N):- mylength(T, X), N is X+1.

sum([], 0).
sum([H|T], S):- sum(T, X), S is H+X.

prod([X], X).
prod([], 0).
prod([H|T], P):- prod(T, TP), P is H*TP. % Has a bug

nthElement(X, 0, [X|_]).
nthElement(X, Index, [_|T]):- nthElement(X, Index1, T), Index is Index1+1.

intervalGenerator(A, A, [A]).
intervalGenerator(A, B, [A|T]):- A =< B, C is A+1, intervalGenerator(C, B, T).

natural(0).
natural(X):- natural(Y), X is Y+1.

even(0).
even(X):- X >= 0, natural(Y), X is 2*Y.