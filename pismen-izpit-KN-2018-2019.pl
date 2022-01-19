% Task 2
between(A, B, A):- A =< B.
between(A, B, C):- A < B, A1 is A+1, between(A1, B, C).

natural(0).
natural(X):- natural(Y), X is Y+1.

surface(M, N, S):- S is M*N.

correctSizes(S, M, N):- between(1, S, M), between(1, S, N), S is M*N, M / N =:= 3.

getPiece(S, K, PieceArea):- S mod K =:= 0, PieceArea is S / K.

pairs(A, B):- natural(K), between(0, K, A), B is K-A.

trios(M, N, K):- pairs(M, N), M > 0, N > 0, S is M*N, between(1, S, K).

cake(M, N, K):- trios(M, N, K), surface(M, N, S), getPiece(S, K, PieceArea), correctSizes(PieceArea, M1, N1), M1 =< M, N1 =< N.