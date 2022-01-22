% Task 1
mybetween(A, B, A):- A =< B.
mybetween(A, B, C):- A < B, A1 is A+1, mybetween(A1, B, C).

mymember(X, [X|_]).
mymember(X, [_|T]):- mymember(X, T).

mymax(L, M):- mymember(M, L), not(( mymember(N, L), N > M )).

commonDivisor(L, Div):- L \= [], mymax(L, Max), between(1, Max, Div), not(( mymember(X, L), X mod Div =\= 0 )).

nod(L, Nod):- commonDivisor(L, Nod), not(( commonDivisor(L, N), N > Nod )).

mylength([], 0).
mylength([_|T], N):- mylength(T, N1), N is N1+1.

mysubset([], []).
mysubset([H|T], [H|Rest]):- mysubset(T, Rest).
mysubset([_|T], Subset):- mysubset(T, Subset).

p([], 0).
p(L, N):- mylength(L, Len), Len >= N, mysubset(L, LS1), mylength(LS1, N), nod(LS1, Nod1),
          not(( mysubset(L, LS2), N1 is N-1, mylength(LS2, N1), nod(LS2, Nod2), Nod1 =:= Nod2 )).



% Task 2
shallow(A, B):- mylength(A, N), N > 1, not(( mymember(X, A), mymember(Y, A), X =\= Y, Z is X+Y, not(mymember(Z, B)) )).

shallowedByAllNextelements([_]).
shallowedByAllNextelements([H|T]):- T \= [], not(( mymember(X, T), not(shallow(H, T)) )), shallowedByAllNextelements(T).

q([], []).
q(L, S):- mysubset(L, S), shallowedByAllNextelements(S), mylength(S, N1),
          not(( mysubset(L, P), shallowedByAllNextelements(P), mylength(P, N2), N1 < N2 )).