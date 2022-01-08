% ~~~ TASK 1 ~~~
remove(X, L, Result):- append(A, [X|B], L), append(A, B, Result).

myintersection(A, B, []):- not(( member(X, A), member(X, B) )).
myintersection(A, B, [H|T]):- member(H, A), member(H, B), remove(H, A, A1), remove(H, B, B1), myintersection(A1, B1, T).

% Check if a specific list is a piece
piece([], _).
piece([H|T], L):- member([H, _], L), remove([H,_], L, L1), piece(T, L1).

% Calculate size of the piece
r([], _, 0).
r([H|T], [[H,Snd]|LT], N):- N1 is N-Snd, r(T, LT, N1).
r([H|T], [[Fst,_]|LT], N):- H \= Fst, r([H|T], LT, N).

% Check requirement of the task
indepen(L):- piece(A, L), piece(B, L), myintersection(A, B, C), r(C, L, RC), r(A, L, RA), r(B, L, RB), RC is RA*RB.



% ~~~ TASK 2 ~~~
natural(1).
natural(N):- natural(Y), N is Y+1.

myindex([H|_], 0, H).
myindex([_|T], Index, X):- Index > 0, Index1 is Index-1, myindex(T, Index1, X).

period(A):- natural(D), length(A, LA), LA > 0, D < LA,
            not(( natural(N), length(A, LA), N < LA, N mod 3 =:= 1, 
            I is N+D, myindex(A, I, Element1), myindex(A, N, Element2), Element1 \= Element2 )).

infinity([]).
infinity([0|T]):- infinity(T).
infinity(1|T):- infinity(T).
