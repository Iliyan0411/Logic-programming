% new arithmetic

:- use_module(library(clpfd)).

lengthCLP([], N):- N #= 0.
lengthCLP([_|T], N):- N #= M+1, lengthCLP(T, M).

betweenCLP(X, A, B):- X in A..B, label([X]).

sumCLP(A, B, N):- A+B #= N, A in 0..N, label([A, B]).

factCLP(N, F):- N #= 0, F #= 1.
factCLP(N, F):- N #> 0, F #= F1*N, factCLP(N-1, F1).

permCLP(P):- lengthCLP(P, 5), P ins 0..4, all_distinct(P), label(P).
