% Task 1
mymember(X, [X|_]).
mymember(X, [_|T]):- mymember(X, T).

intersection([], B, B).
intersection(A, [], A).
intersection([H1|T1], [H2|T2], [H1|T]):- H1 =:= H2, intersection(T1, T2, T).

subset([], _).
subset([H1|T1], L):- mymember(H1, L), subset(T1, L).

is_laminar([_]).
is_laminar(L):- (mymember(A, L), mymember(B, L), A \= B, intersection(A, B, []));
                (mymember(C, L), mymember(D, L), C \= D, (subset(C, D); subset(D, C))).



% Task 2
% Not solved on 100%, but good try :D
area(N, M, S):- S is N*M.

mybetween(A, B, A):- A =< B.
mybetween(A, B, C):- A < B, A1 is A+1, mybetween(A1, B, C).

maxArea(S, K, MaxS):- MaxS is S div K.

possibleSizes(N, M, S):- mybetween(1, S, N), mybetween(1, S, M), S is N*M.

saveChristmas(N, M, K, []):- N = 0; M = 0; K = 0.
saveChristmas(N, M, K, L):- N > 0, M > 0, K > 0, area(N, M, S), maxArea(S, K, MaxS), mybetween(1, MaxS, CardArea), 
                            possibleSizes(CardN, CardM, CardArea), member([CardN, CardM], L).