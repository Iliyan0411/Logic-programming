% Task 1
natural(0).
natural(X):- natural(Y), X is Y+1.

hasNaturalSquare(N, D):- N > 1, T is N div 2, D =< T, N is D^2.
hasNaturalSquare(N, D):- N > 1, T is N div 2, D =< T, N =\= D^2, D1 is D+1, hasNaturalSquare(N, D1).
hasNaturalSquare(N):- N =:= 0; N =:= 1; hasNaturalSquare(N, 2).

hasNaturalTripleSquare(N, D):- N > 1, T is N div 3, D =< T, N is D^3.
hasNaturalTripleSquare(N, D):- N > 1, T is N div 3, D =< T, N =\= D^3, D1 is D+1, hasNaturalTripleSquare(N, D1).
hasNaturalTripleSquare(N):- N =:= 0; N =:= 1; hasNaturalTripleSquare(N, 2).

mylength([], 0).
mylength([_|T], N):- mylength(T, N1), N is N1+1.

sumOfElements([], 0).
sumOfElements([H|T], S):- sumOfElements(T, S1), S is S1+H.

squareList(L):- mylength(L, N), sumOfElements(L, S), hasNaturalSquare(N), hasNaturalSquare(S).

cubeList(L):- mylength(L, N), sumOfElements(L, S), hasNaturalTripleSquare(N), hasNaturalTripleSquare(S).



% Task 2
% between(A, B, A):- A =< B.
% between(A, B, C):- A < B, A1 is A+1, between(A1, B, C).

% sign(0, 0).
% sign(N, M):- N =\= 0, (M is N; M is -N).

% int(0).
% int(Z):- natural(N), N > 0, sign(N, Z).

% pairs(A, B):- natural(K), between(0, K, A), B is K-A.

% racional(0).
% racional(Q):- pairs(A, B), A =\= 0, B =\= 0, sign(A, A1), Q is A1 / B.

distance([X1, Y1], [X2, Y2], Dist):- Expr is ((X2-X1)^2 + (Y2-Y1)^2), sqrt(Expr, Dist).

independentCircles([X1, Y1], [X2, Y2]):- distance([X1, Y1], [X2, Y2], Dist), Dist > 1.

subset([], []).
subset([H|T], [H|Rest]):- subset(T, Rest).
subset([_|T], Subset):- subset(T, Subset).

allIndependent([]).
allIndependent(M):- not(( member(A, M), member(B, M), A \= B, not(independentCircles(A, B)) )).

max_independent([], []).
max_independent(S, M):- subset(S, M), allIndependent(M), mylength(M, N), 
                        not(( subset(S, M1), mylength(M1, N1), allIndependent(M1), N < N1 )).

allHover([H|T], M):- subset([H|T], M), M \= [], not(( member(A, M), distance(H, A, Dist), Dist > 1 )).

min_cover(S, M):- allHover(S, M), mylength(M, N), not(( allHover(S, M1), mylength(M1, N1), N > N1 )).