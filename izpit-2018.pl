% This exam can be find on https://github.com/YanaRGeorgieva/Logic-programming/blob/master/%D0%97%D0%B0%D0%B4%D0%B0%D1%87%D0%B8%20%D0%BE%D1%82%20%D0%BC%D0%B8%D0%BD%D0%B0%D0%BB%D0%B8%20%D0%B3%D0%BE%D0%B4%D0%B8%D0%BD%D0%B8/izp.pdf

% Task 1
mymember(X, [X|_]).
mymember(X, [_|T]):- mymember(X, T).

count(_, [], 0).
count(X, [X|T], N):- count(X, T, N1), N is N1+1.
count(X, [H|T], N):- X =\= H, count(X, T, N).

highCount(L, Max):- mymember(X, L), count(X, L, Max), not(( mymember(Y, L), X =\= Y, count(Y, L, N), N > Max )).

lowCount(L, Min):- mymember(X, L), count(X, L, Min), not(( mymember(Y, L), X =\= Y, count(Y, L, N), N < Min )).

diameter([], 0).
diameter(L, D):- L \= [], highCount(L, Max), lowCount(L, Min), D is Max-Min.

p([]).
p([_]).
p(L):- not(( mymember(X, L), mymember(Y, L), X =\= Y, diameter(X, N), diameter(Y, M), N =\= M )).
