% ...

% Task 1
cond([]).
cond([H|T]):- H > 0, cond(T).

mymember(X, [X|_]).
mymember(X, [_|T]):- mymember(X, T).

p(L, 1, Flag):- Flag is 1; (mymember(M, L), M is 1).
p(L, N, _):- N > 1, mymember(M, L), M =\= 1, N mod M =:= 0, N1 is N / M, p(L, N1, 1).
p(L, N):- cond(L), p(L, N, 0).



% Task 2
natural(0).
natural(X):- natural(Y), X is Y+1.

distance(X1, Y1, X2, Y2, Dist):- Expr is ((X1-X2)^2 + (Y1-Y2)^2), sqrt(Expr, Dist). 

circles(X, Y, R, Z, T, S):- natural(Z), natural(T), natural(S), R > 0, S > 0, R =< S, distance(X, Y, Z, T, Dist), Len is R+Dist, Len =< S. 
