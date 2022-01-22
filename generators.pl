natural(0).
natural(X):- natural(Y), X is Y+1.

% Generate in M all lists, which elements are elements of L
m(_, []).
m(L, [H|T]):- m(L, T), member(H, L).


%
sign(0, 0).
sign(N, M):- N =\= 0, (M is N; M is -N).

int(Z):- natural(N), sign(N, Z).

divisionGenrator(_, 0).
divisionGenrator(M, N):- natural(X), X =\= 0, X mod M =:= 0, sign(X, N).

%
between(A, B, A):- A =< B.
between(A, B, C):- A < B, A1 is A+1, between(A1, B, C).

pairs(A, B):- natural(K), between(0, K, A), B is K-A.

%
generateKNumbersWithSumS(0, 0, []).
generateKNumbersWithSumS(K, S, [H|T]):- K > 0, between(0, S, H), S1 is S-H, K1 is K-1, generateKNumbersWithSumS(K1, S1, T).


%
binary([]).
binary([A, B]):- binary(A), binary(B).

%
splitGenerator([], []).
splitGenerator([H|T], [A|Rest]):- append(A, B, [H|T]), A \= [], splitGenerator(B, Rest).

%
pack([], []).
pack([A], [[A]]).
pack([A, B|T], [[A]|Rest]):- A \= B, pack([B|T], Rest).
pack([A, A|T], [[A|CL]|Rest]):- pack([A|T], [CL|Rest]).


/*3. Да се напише предикат p(N), генериращ ввсички числа от вида ai + bj:
   |a0 = 1						|b0 = 7
   |aN = 3*a(N - 1) + n 		|bN = 3b(N - 1) + n^2 - 1
*/
a(1, 1, 4).
a(Prev, N, Curr):- N > 1, N1 is N-1, a(PrevPrev, N1, Prev), Curr is 3*Prev + N.
a(Prev, Curr):- natural(N), N > 0, a(Prev, N, Curr).

b(7, 1, 21).
b(Prev, N, Curr):- N > 1, N1 is N-1, b(PrevPrev, N1, Prev), Curr is 3*Prev + N^2 - 1.
b(Prev, Curr):- natural(N), N > 0, b(Prev, N, Curr).

p(N):- natural(N), natural(X1), natural(X2), a(X1, _), b(X2, _), X1 < N, X2 < N, N is X1+X2.

%
from0To1000Generator(X):- natural(X), X =< 1000, between(0, X, N), between(0, X, K), X is 8*(N+11)^5 * (19+K)^2.


%
generateAllFiniteSequencesOfNaturalNumbers(L):- pairs(K, S), generateKNumbersWithSumS(K, S, L).

arithmetic(L):- generateAllFiniteSequencesOfNaturalNumbers(L), condition(L).

condition([]).
condition([A, B]):- A < B.
condition(L):- length(L, N), N > 2, not(( append(_, [AN, AN1, AN2|_], L), not(( AN < AN1, AN1 =:= (AN + AN2) / 2)) )).


%
addNewPairs([X], _, [X]).
addNewPairs([[A,B], [C,D]|Rest], N, [[A,B], [E,F], [C,D]|NewRest]):- N =:= B+D, E is A+C, F is N, addNewPairs([[C,D]|Rest], N, [[C,D]|NewRest]).
addNewPairs([[A,B], [C,D]|Rest], N, [[A,B], [C,D]|NewRest]):- N =\= B+D, addNewPairs([[C,D]|Rest], N, [[C,D]|NewRest]). 

farey([[0,1], [1,1]], 1).
farey(L, N):- farey(L1, N1), N is N1+1, addNewPairs(L1, N, L).
farey(L):- farey(L, _).
