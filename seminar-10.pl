
between(A, B, A):- A =< B.
between(A, B, C):- A < B, A1 is A+1, between(A1, B, C).

natural(0).
natural(X):- natural(Y), X is Y+1.

sign(N, M):- N =\= 0, (M = N; M is -N).

int(0).
int(Z):- natural(N), sign(N, Z).

kratno(0, _).
kratno(X, M):- kratno(Y, M), (X is Y-M; X is Y+M).

generateKNumbersWithSumS(1, S, [S]).
generateKNumbersWithSumS(K, S, [H|T]):- K > 1, K1 is K-1, between(0, S, H), S1 is S-H, generateKNumbersWithSumS(K1, S1, T).

% slow
% fibb(0, 0).
% fibb(1, 1).
% fibb(N, X):- N > 1, N1 is N-1, N2 is N-2, fibb(N1, X1), fibb(N2, X2), X is X1+X2.
% fibb(X):- natural(N), fibb(N, X).

fibb(0, 1).
fibb(Y, Z):- fibb(X, Y), Z is X+Y.
fibb(X):- fibb(X, _).

split([], []).
split([H|T], [A|Rest]):- append(A, B, [H|T]), A \= [], split(B, Rest).

% Write predicate, whick pack equal and sequenced elements in list L
% For example L = [1,2,2,3,4,4,4] -> [[1], [2,2], [3], [4,4,4]]
pack([], []).
pack([A], [A]).
pack([A,B|T], [[A]|C]):- A \= B, pack([B|T], C).
pack([A,A|T], [[A|A1]|C]):- pack([A|T], [A1|C]).