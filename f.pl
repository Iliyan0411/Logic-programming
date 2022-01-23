myabs(X, X):- X >= 0.
myabs(X, Y):- Y is -X, X < 0.

mymember(X, [X|_]).
mymember(X, [_|T]):- mymember(X, T).

mylength([], 0).
mylength([_|T], N):- mylength(T, N1), N is N1+1.

isSquare([X, Y, A, B]):- X < A, Y < B, T1 is A-X, T2 is B-Y, myabs(T1, D1), myabs(T2, D2), D1 =:= D2.

subsquare([X1,Y1,A1,B1], [X2,Y2,A2,B2]):- isSquare([X1,Y1,A1,B1]), isSquare([X2,Y2,A2,B2]),
                                          X1 > X2, Y1 > Y2, A1 < A2, B1 < B2.


% a)
p(X, [A]):- mymember(A, X).
p(X, [A, B|T]):- mymember(A, X), mymember(B, X), subsquare(A, B), p(X, [B|T]).

% b)
m(X, Y):- p(X, Y), mylength(Y, N), not(( p(X, Z), mylength(Z, M), N < M )).
