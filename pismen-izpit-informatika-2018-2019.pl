% Task 1
isPrime(P):- P > 1, P1 is P div 2, 
            not(( between(2, P1, Try), P mod Try =:= 0 )).

e(K, I, 0):- PK is 6*K+1, PK >= I.
e(K, I, N):- PK is 6*K+1, PK < I, isPrime(PK), K1 is K+1, M is N-1, e(K1, I, M).
e(K, I, N):- PK is 6*K+1, PK < I, not(isPrime(PK)), K1 is K+1, e(K1, I, N).

su(X):- between(0, X, I), e(2, I, N), X =:= I+N.


% Task 2
% Has a bug with generating of a G-list
natural(0).
natural(N):- natural(M), N is M+1.

gList([]).
gList([[X,Y]|T]):- natural(X), natural(Y), gList(T).

do([], _, 0).
do([[K,_]|T], K, N):- gList(T), do(T, K, M), N is M+1.
do([[X,_]|T], K, N):- gList(T), X \= K, do(T, K, N).

di([], _, 0).
di([[_,K]|T], K, N):- gList(T), do(T, K, M), N is M+1.
di([[_,X]|T], K, N):- gList(T), X \= K, do(T, K, N).

e1g(L):- gList(L), not(( natural(K), do(L, K, N1), di(L, K, N2), N is N1-N2, abs(N, M), M > 1 )).
e1g(L):- gList(L), not(( natural(K), do(L, K, N1), di(L, K, N2), N is N1-N2, abs(N, M), M > 2 )).