% Task 1
a(0, 0, 1, 1).
a(Prev, N1, Curr, N):- N1 > 0, N2 is N1-1, N is N1+1, a(PrevPrev, N2, Prev, N1), Curr is 5*Prev^2 + 3*PrevPrev^3.

p(A):- not(( between(0, A, N), a(A, N, _, _) )).


% Task 2
% not solved
contracular(X, Y):- not(( member(M1, Y), not(( member(M2, M1), not(( member(X1, X), M2 mod X1 =:= 0 )) )) )),
                    flatten(Y, FlatY), not(( member(Ex, X), not(( member(Ey, FlatY), Ex mod Ey =:= 0 )) )).


% Task with trees. Can be find on https://github.com/YanaRGeorgieva/Logic-programming/blob/master/%D0%97%D0%B0%D0%B4%D0%B0%D1%87%D0%B8%20%D0%BE%D1%82%20%D0%BC%D0%B8%D0%BD%D0%B0%D0%BB%D0%B8%20%D0%B3%D0%BE%D0%B4%D0%B8%D0%BD%D0%B8/%D0%9F%D0%B8%D1%81%D0%BC%D0%B5%D0%BD%20%D0%B8%D0%B7%D0%BF%D0%B8%D1%82%20%D0%98%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%82%D0%B8%D0%BA%D0%B0%202019-2020%20%D0%9B%D1%8F%D1%82%D0%BD%D0%B0%20%D1%81%D0%B5%D1%81%D0%B8%D1%8F%202/solutions.24.08.2020.pdf
% edge([V, E], X, Y):- member(X, V), member(Y, V), (member([X, Y], E); member([Y, X], E)).

% path(_, X, X, Visited, Path):- reverse([X|Visited], Path).
% path([V, E], X, Y, Visited, Path):- edge([V, E], X, Z), not(member(Z, Visited)), path([V, E], Z, Y, [X|Visited], Path).
% path([V, E], X, Y, Path):- path([V, E], X, Y, [], Path).

% hasCycle([V, E], [X|Path]):- edge([V, E], X, Y), path([V, E], Y, X, Path), length(Path, N), N > 2.

% isConnected([V, E]):- not(( member(A, V), member(B, V), A \= B, not(path([V, E], A, B, _)) )).

edge([_, E], X, Y):- member([X, Y], E); member([Y, X], E).

path(_, A, A, Visited, Path):- reverse([A|Visited], Path).
path([V, E], A, B, Visited, Path):- edge([V, E], A, C), not(member(C, Visited)), path([V, E], C, B, [A|Visited], Path).
path([V, E], A, B, Path):- path([V, E], A, B, [], Path).

isConnected([V, E]):- not(( member(A, V), member(B, V), A \= B, not(path([V, E], A, B, _)) )).

hasCycle([V, E], [X|Path]):- edge([V, E], X, Y), path([V, E], Y, X, Path), length(Path, N), N > 2.

hasNotCycle([V, E]):- not(hasCycle([V, E], _)).

isTree([V, E]):- isConnected([V, E]), hasNotCycle([V, E]).

remove(X, L, R):- append(A, [X|B], L), append(A, B, R).

art_tree([V, E], [U, W]):- not(isTree([V, E])), member(U, V), member(W, V), U \= W, isTree([V, [[U,W]|E]]).
arc_tree([V, E], [U, W]):- not(isTree([V, E])), edge([V, E], U, W), remove([U, W], E, NewE), isTree([V, NewE]).

