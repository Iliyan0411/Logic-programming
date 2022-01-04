:- use_module(library(clpfd)).

evenLengthList([]).
evenLengthList([_,_|T]):- evenLengthList(T).

natural(0).
natural(N):- natural(M), N is M+1.

lengthCLP([], N):- N #= 0.
lengthCLP([_|T], N):- N #> 0, lengthCLP(T, N-1).

evenLengthListCLP(L):- lengthCLP(L, 2*_).


node(g1, 1).
node(g1, 2).
node(g1, 3).
node(g1, 4).
node(g1, 5).
node(g1, 6).
node(g1, 7).
node(g1, 8).
node(g1, 9).
node(g1, 10).
node(g1, 11).

node((VV, _), V) :-
    member(V, VV).


edge(g1, 1, 2).
edge(g1, 1, 3).
edge(g1, 1, 4).
edge(g1, 1, 5).
edge(g1, 1, 6).

edge(g1, 2, 8).
edge(g1, 2, 1).
edge(g1, 2, 11).

edge(g1, 3, 9).
edge(g1, 3, 1).
edge(g1, 3, 7).

edge(g1, 4, 8).
edge(g1, 4, 10).
edge(g1, 4, 1).

edge(g1, 5, 1).
edge(g1, 5, 9).
edge(g1, 5, 11).

edge(g1, 6, 7).
edge(g1, 6, 1).
edge(g1, 6, 10).

edge(g1, 7, 8).
edge(g1, 7, 3).
edge(g1, 7, 6).
edge(g1, 7, 11).

edge(g1, 8, 9).
edge(g1, 8, 4).
edge(g1, 8, 2).
edge(g1, 8, 7).

edge(g1, 9, 8).
edge(g1, 9, 10).
edge(g1, 9, 5).
edge(g1, 9, 3).

edge(g1, 10, 6).
edge(g1, 10, 4).
edge(g1, 10, 9).
edge(g1, 10, 11).

edge(g1, 11, 7).
edge(g1, 11, 2).
edge(g1, 11, 5).
edge(g1, 11, 10).

edge((_, EE), V1, V2) :-
    member((V1, V2), EE).


:-table anyPath(+, +, +). % Keeps results in table and prevent from looping
anyPath(G, V, V):- node(G, V).
anyPath(G, V, U):- edge(G, V, W), anyPath(G, W, U).

:-table generatePath(+, +, +, -).
generatePath(_, V, V, [V]).
generatePath(G, V, U, [V|Rest]):- edge(G, V, W), generatePath(G, W, U, Rest).

:-table fib(+, +).
fib(0, 0).
fib(1, 1).
fib(N, Z):- N > 1, N1 is N-1, N2 is N-2, fib(N1, X), fib(N2, Y), Z is X+Y.

lazyRange(A, B, R):- bagof(X, between(A, B, X), R).
